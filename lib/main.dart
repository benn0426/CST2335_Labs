import 'package:flutter/material.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String imageSource = "images/question-mark.png";
  late TextEditingController _controllerLogin;
  late TextEditingController _controllerPassword;
  late EncryptedSharedPreferences storedData;


  @override
  void initState() {
    super.initState();
    _controllerLogin = TextEditingController();
    _controllerPassword = TextEditingController();

    storedData = EncryptedSharedPreferences();
    storedData.getString("userName").then( (savedUserName) {
      if(savedUserName.isNotEmpty) {
        _controllerLogin.text = savedUserName;
      }
    });
    storedData.getString("userPsw").then( (savedUserPsw) {
      if(savedUserPsw.isNotEmpty) {
        _controllerPassword.text = savedUserPsw;
        var snackBar = const SnackBar(
          content: Text('Data successfully loaded'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });

  }


  @override
  void dispose() {
    _controllerLogin.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  void loginBtnPressed() {
    String userName = _controllerLogin.value.text;
    String userPsw = _controllerPassword.value.text;
    setState(() {
      if(userPsw == "QWERTY123") {
        imageSource = "images/idea.png";
        showDialog<String>(
            context: context,
            builder: (BuildContext context) =>
            AlertDialog(
                title: const Text('Save Info'),
                content: const Text('Would you like to save your information for nex time'),
                actions: <Widget>[
                  ElevatedButton(child: const Text('ok'), onPressed: () async {
                    final storedData = EncryptedSharedPreferences();
                    storedData.setString("userName", userName);
                    storedData.setString("userPsw", userPsw);
                    Navigator.pop(context);
                  },),
                  FilledButton(child: const Text('cancel'), onPressed: (){Navigator.pop(context);},),
                ]
            )
        );
      } else {
        imageSource = "images/stop.png";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(controller: _controllerLogin,
                decoration: const InputDecoration(
                    hintText:"Username/Email",
                    border: OutlineInputBorder(),
                    labelText: "Login"
                )),
            const SizedBox(height: 10),
            TextField(controller: _controllerPassword,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText:"Type here!",
                    border: OutlineInputBorder(),
                    labelText: "Password"
                )),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: loginBtnPressed, child: const Text('Login')),
            Image.asset(imageSource, width: 300, height: 300),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

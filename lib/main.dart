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
      title: 'Flutter Lab5',
      initialRoute: '/home',
      routes: {
        '/home': (context) { return const MyHomePage(title: 'Flutter Lab5',); },
        '/second': (context) { return const MyLoginPage(title: 'Flutter Lab5',); },
      },
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
  static String userLogin = "";


  @override
  void initState() {
    super.initState();
    _controllerLogin = TextEditingController();
    _controllerPassword = TextEditingController();
  }
  @override
  void dispose() {
    _controllerLogin.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }


  void loginBtnPressed() {
    String userPsw = _controllerPassword.value.text;
    userLogin = _controllerLogin.value.text;
    Navigator.pushNamed(context, "/second");
    setState(() {
      if(userPsw == "QWERTY123") {
        imageSource = "images/idea.png";
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
      ),
    );
  }
}




// Second page



class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key, required this.title});

  final String title;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  late TextEditingController _controllerFirstName;
  late TextEditingController _controllerLastName;
  late TextEditingController _controllerPhone;
  late TextEditingController _controllerEmail;
  late EncryptedSharedPreferences storedData;

  void loadData() {
    // var snackBar = SnackBar( content: Text('Welcome back: $_MyHomePageState.userLogin'), );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // storedData = EncryptedSharedPreferences();
    // storedData.getString("userName").then( (savedUserName) {
    //   if(savedUserName.isNotEmpty) {
    //     _controllerLogin.text = savedUserName;
    //   }
    // });
    // storedData.getString("userPsw").then( (savedUserPsw) {
    //   if(savedUserPsw.isNotEmpty) {
    //     _controllerPassword.text = savedUserPsw;
    //   }
    // });
  }
  void saveData() {
    // final storedData = EncryptedSharedPreferences();
    // storedData.setString("userName", userName);
    // storedData.setString("userPsw", userPsw);
  }

  @override
  void initState() {
    super.initState();
    _controllerFirstName = TextEditingController();
    _controllerLastName = TextEditingController();
    _controllerPhone = TextEditingController();
    _controllerEmail = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Welcome back: ${_MyHomePageState.userLogin}')),
      );
    });

    loadData();
  }
  @override
  void dispose() {
    _controllerFirstName.dispose();
    _controllerLastName.dispose();
    _controllerPhone.dispose();
    _controllerEmail.dispose();

    saveData();
    super.dispose();
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
            TextField(controller: _controllerFirstName,
                decoration: const InputDecoration(
                    hintText:"First name...",
                    border: OutlineInputBorder(),
                    labelText: "First Name"
                )),
            const SizedBox(height: 10),
            TextField(controller: _controllerLastName,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText:"Last name...",
                    border: OutlineInputBorder(),
                    labelText: "Last Name"
                )),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Flexible (child:
                TextField(controller: _controllerPhone,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText:"Phone number...",
                        border: OutlineInputBorder(),
                        labelText: "Phone Number"
                    )),),
                ElevatedButton(onPressed: testFunction, child: const Text('Login')),
                ElevatedButton(onPressed: testFunction, child: const Text('Login')),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Flexible (child:
                TextField(controller: _controllerEmail,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText:"Email address...",
                        border: OutlineInputBorder(),
                        labelText: "Email Address"
                    )),),
                ElevatedButton(onPressed: testFunction, child: const Text('Login')),
              ],
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void testFunction() {
  }
}

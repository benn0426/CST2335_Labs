import 'package:flutter/material.dart';

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
  int _counter = 0;
  String imageSource = "images/question-mark.png";
  late TextEditingController _controllerLogin;
  late TextEditingController _controllerPassword;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

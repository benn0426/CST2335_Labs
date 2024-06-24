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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "BROWSE CATEGORIES",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(flex: 1),
            const Text("Not sure about exactly which recipe you're looking for? Do a search, or dive into our most popular categories."),
            const Spacer(flex: 1),
            const Text(
              "BY MEAT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                      children: <Widget>[
                        Image.asset(
                          "images/Beef.jpg",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ]),
                  const Text(
                    "Beef",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Chicken.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Chicken",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Pork.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Pork",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Seafood.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const  Text(
                      "Seafood",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ]),
            const Text(
              "BY COURSE",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Maindish.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Main Dishes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Salad.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Salad Recipes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Sidedish.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Side Dishes",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Crockpot.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const  Text(
                      "Crockpot",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ]),
            const Text(
              "BY DESERT",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: <Widget>[
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Icecream.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Ice cream",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Brownies.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Brownies",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                            "images/Pies.jpg",
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ]),
                    const Text(
                      "Pies",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Stack(
                        children: <Widget>[
                          Image.asset(
                          "images/Cookies.jpg",
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ]),
                    const Text(
                      "Cookies",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ]),
          ],
        ),
      ),
    );
  }
}

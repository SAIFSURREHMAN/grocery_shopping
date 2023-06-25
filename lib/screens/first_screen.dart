import 'package:flutter/material.dart';
import 'package:grid_items/screens/second_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      print("Executed after 5 seconds");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GroceryHomePage()),
            );
          },
          child: Image.asset('assets/background.png'),
        ),
      ),
    );
  }
}

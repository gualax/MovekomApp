import 'package:flutter/material.dart';
import 'package:movekomapp/FloatingMenu.dart';
import 'package:movekomapp/Menu1.dart';
import 'package:movekomapp/PrincipalHome.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(indexToShow:0),
        '/menus': (context) => FloatingMenu(),
        '/principal': (context) => PrincipalHome(),
        '/menu1': (context) => Menu1(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    //  home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


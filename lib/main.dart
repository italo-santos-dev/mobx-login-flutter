import 'package:flutter/material.dart';
import 'package:mobx_project/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tarefas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyanAccent[400],
        cursorColor: Colors.cyanAccent[400],
        // scaffoldBackgroundColor: Colors.cyanAccent[400],
      ),
      home: LoginScreen(),
    );
  }
}

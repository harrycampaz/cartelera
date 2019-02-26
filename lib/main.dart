import 'package:flutter/material.dart';
import 'package:flutter_cartelera/pages/myHomePage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cartelera Demo',
      theme: ThemeData.dark(
      ),
      home: MyHomePage(title: 'Cartelera'),
      debugShowCheckedModeBanner: false,
    );
  }
}


import 'package:flutter/material.dart';
import 'package:habit/pages/home_page.dart';
import 'package:hive_flutter/adapters.dart';

void main()async {
  //hive initialize
 await Hive.initFlutter();
 //open box in hive
 await Hive.openBox("Habit_Database");//name of database
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme:  ThemeData(

        primarySwatch: Colors.green



      )
    );
  }
}
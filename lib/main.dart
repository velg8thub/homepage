//import 'package:cuc/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:velflutter/homescreen/homepage.dart';
import 'package:velflutter/homescreen/order_content.dart'; // Import the file
import 'package:velflutter/homescreen/staff_content.dart';
import 'package:velflutter/homescreen/truck_content.dart';
import 'package:velflutter/homescreen/payroll_content.dart';
import 'package:velflutter/homescreen/delivery_content.dart';
import 'package:velflutter/homescreen/home_content.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

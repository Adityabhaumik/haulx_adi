import 'package:assignment_haulx/screens/home.dart';
import 'package:assignment_haulx/screens/all_loads.dart';
import 'package:assignment_haulx/screens/order_details.dart';
import 'package:assignment_haulx/screens/order_status.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Home(),
        routes: {
          Home.id: (context) => const Home(),
          Load.id: (context) => const Load(),
          OrderDetails.id: (context) => const OrderDetails(),
          OrderStatus.id :(context) =>const OrderStatus()
        });
  }
}

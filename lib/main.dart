import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_of_gtr/Routes%20Controller/route_pages.dart';
import 'Routes Controller/route_names.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Material App',
      getPages: routes,
      initialRoute: loginPage,
    );
  }
}
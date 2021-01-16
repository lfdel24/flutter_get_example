import 'package:flutter/material.dart';
import 'package:flutter_get_example/screens/home_screen.dart';
import 'package:flutter_get_example/screens/todo_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Todos lfdel24@gmail.com",
    home: HomeScreen(),
  ));
}

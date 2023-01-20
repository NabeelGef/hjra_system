import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hjra_system/views/control_panel.dart';
import 'package:hjra_system/views/home.dart';
import 'package:hjra_system/views/managers.dart';

import 'views/hr.dart';
import 'views/login.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.green,
    ),
    initialRoute: '/',
    getPages: [
      GetPage(name: "/", page: ()=> const Login()),
      GetPage(name: "/hr", page: ()=> const HR()),
      GetPage(name: "/home", page: () => const Home()),
      GetPage(name: "/managers", page: ()=>const Managers()),
      GetPage(name: "/control", page: ()=>const ControlPanel())
    ],
  ));
}


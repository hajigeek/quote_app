// ignore_for_file: prefer_const_constructors

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:helloworld/ui/splash_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => PracLoading(),
    },
  ));
}

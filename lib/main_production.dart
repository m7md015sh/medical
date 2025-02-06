import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medical_app/core/di/dependency_injection.dart';
import 'package:medical_app/core/routing/app_router.dart';
import 'package:medical_app/doc_app.dart';

void main() {
  setUpGetIt();
  // Set status bar color at the start of the app
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue, // Change this color
    statusBarIconBrightness: Brightness.light, // Icons color (light or dark)
  ));

  runApp( DocApp(appRouter: AppRouter()));
}


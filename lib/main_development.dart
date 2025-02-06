import 'package:flutter/material.dart';
import 'package:medical_app/core/di/dependency_injection.dart';
import 'package:medical_app/core/routing/app_router.dart';
import 'package:medical_app/doc_app.dart';

void main() {
  setUpGetIt();
  runApp( DocApp(appRouter: AppRouter()));
}


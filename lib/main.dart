import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:typical_food/app/app_widget.dart';
import 'package:typical_food/app/common/injects/inject_dependency.dart';
import 'package:typical_food/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InjectDependency.init();
  runApp(const AppWidget());
}

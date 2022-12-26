import 'package:flutter/material.dart';
import 'package:typical_food/app/app_widget.dart';
import 'package:typical_food/app/common/injects/inject_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InjectDependency.init();
  runApp(const AppWidget());
}

import 'package:flutter/material.dart';
import 'package:smart_home/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Dashboard();
  }
}

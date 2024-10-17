import 'package:first_module/ui/test_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const FirstModuleScreen());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First Module',
      home: const FirstModuleScreen(),
    );
  }
}


class FirstModuleScreen extends StatelessWidget {
  const FirstModuleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Module')),
      body: const TestWidget(),
    );
  }
}
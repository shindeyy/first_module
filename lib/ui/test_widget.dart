import 'all_widget_example.dart';
import 'form_example.dart';
import 'manage_state.dart';
import 'package:flutter/material.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/gifs/FITTR.gif'),
          const SizedBox(height: 10),const TapboxA(),
          const SizedBox(height: 10),
          const ParentWidget(),
          const SizedBox(height: 10),
          const FormExample(),
          const SizedBox(height: 10),
          const AllWidgetExample(),
          const SizedBox(height: 10),
          Container(
            color: Colors.red,
            height: 100,
            width: double.infinity,
            child: const Center(child: Text('Container 1')),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.green,
            height: 100,
            width: double.infinity,
            child: const Center(child: Text('Container 2')),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.blue,
            height: 100,
            width: double.infinity,
            child: const Center(child: Text('Container 3')),
          ),
        ],
      ),
    ));
  }
}

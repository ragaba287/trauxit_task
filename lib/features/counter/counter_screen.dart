import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trauxit Task'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: Column(
        children: [
          Icon(Icons.abc),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('context.translate.titleApp'),
      ),
      body: const Center(
        child: Text('context.translate.titleApp'),
      ),
    );
  }
}

import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:flutter/material.dart';

@Service()
class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Other'),
      ),
      body: const Center(
        child: Text('Other screen'),
      ),
    );
  }
}

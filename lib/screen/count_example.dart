import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({Key? key}) : super(key: key);

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    print("build = ${countProvider.count}");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usage of Provider - Rahul'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountProvider>(
              builder: (context, value, child) {
                print("Inside Consumer build = ${countProvider.count}");
                return Text("Build = ${countProvider.count}",
                    style: const TextStyle(fontSize: 25));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}

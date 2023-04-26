import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/example_one_provider.dart';

class ExampleOne extends StatefulWidget {
  const ExampleOne({Key? key}) : super(key: key);

  @override
  State<ExampleOne> createState() => _ExampleOneState();
}

class _ExampleOneState extends State<ExampleOne> {
  //double value = 1.0;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    print("Build - Example one");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Provider Usage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Slider(
                min: 0,
                max: 1,
                value: value.value,
                onChanged: (val) {
                  print(value);
                  value.setValue(val);
                });
          }),
          Consumer<ExampleOneProvider>(builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(value.value)),
                    child: const Center(
                      child: Text("Container-1"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(value.value)),
                    child: const Center(
                      child: Text("Container-2"),
                    ),
                  ),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}

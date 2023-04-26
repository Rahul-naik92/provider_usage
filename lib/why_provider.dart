import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({Key? key}) : super(key: key);

  @override
  State<WhyProvider> createState() => _WhyProviderState();
}
//if we dont use the provider it will continue to rebuild the widget which is cost, now lets see how to use provider

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    print("build = $count");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rahul Naik'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
              style: const TextStyle(fontSize: 50),
            ),
          ),
          Text("Build = $count", style: const TextStyle(fontSize: 25))
        ],
      ),
    );
  }
}

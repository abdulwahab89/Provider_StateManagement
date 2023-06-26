import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/provider/CountProvider.dart';
import 'package:provider_sx/provider/ExampleMultiProvider.dart';

class Screen extends StatefulWidget {
  Screen({Key? key}) : super(key: key);
  int count = 0;
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 1), (timer) {
      countProvider.setCount();
    });
  }

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    final valueProvider = Provider.of<MultiProviderExample>(context);
    print('build' + countProvider.count.toString());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CountProvider>(
            builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style: const TextStyle(
                  fontSize: 20,
                ),
              );
            },
          )),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              countProvider.setCount();
            },
            child: Container(
              child: const Text(
                'Count',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

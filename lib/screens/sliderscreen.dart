import 'package:flutter/material.dart';
import 'package:provider_sx/provider/CountProvider.dart';
import 'package:provider_sx/provider/ExampleMultiProvider.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({Key? key}) : super(key: key);

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final valueProvider =
        Provider.of<MultiProviderExample>(context, listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<MultiProviderExample>(
              builder: (context, value, child) {
                return Slider(
                    min: 0,
                    max: 1,
                    value: value.value,
                    onChanged: (val) {
                      value.setValue(val);
                    });
              },
            ),
          ),
          Consumer<MultiProviderExample>(
            builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.red.withOpacity(valueProvider.value),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    color: Colors.green.withOpacity(valueProvider.value),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

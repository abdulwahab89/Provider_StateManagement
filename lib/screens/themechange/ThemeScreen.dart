import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/provider/theme_changer.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final _themeMode = Provider.of<ThemeChanger>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('date'),
        ),
        body: Column(
          children: [
            RadioListTile(
              title: Text('Light'),
              value: ThemeMode.light,
              groupValue: _themeMode.themeMode,
              onChanged: _themeMode.setTheme,
            ),
            RadioListTile(
              title: Text('Dark'),
              value: ThemeMode.dark,
              groupValue: _themeMode.themeMode,
              onChanged: _themeMode.setTheme,
            ),
            RadioListTile(
              title: Text('System'),
              value: ThemeMode.system,
              groupValue: _themeMode.themeMode,
              onChanged: _themeMode.setTheme,
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/login_provider.dart';
import 'package:provider_sx/login_screen.dart';
import 'package:provider_sx/provider/CountProvider.dart';
import 'package:provider_sx/provider/ExampleMultiProvider.dart';
import 'package:provider_sx/provider/theme_changer.dart';
import 'provider/favourite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => MultiProviderExample()),
        ChangeNotifierProvider(create: (_) => FavProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final _themeMode = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            themeMode: _themeMode.themeMode,
            theme: ThemeData(
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
            ),
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:usage_provider/provider/count_provider.dart';
import 'package:usage_provider/provider/example_one_provider.dart';
import 'package:usage_provider/provider/favourite_provider.dart';
import 'package:usage_provider/provider/theme_changer_provider.dart';
import 'package:usage_provider/screen/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CountProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ExampleOneProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemChangeProvider(),
        ),
      ],
      child: Builder(builder: (BuildContext context) {
        final themchanger = Provider.of<ThemChangeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themchanger.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.orange,
          ),
          darkTheme: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.purple,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
              iconTheme: const IconThemeData(color: Colors.orange)),
          home: const DarkTheme(),
        );
      }),
    );
  }
}

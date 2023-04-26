import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_changer_provider.dart';

class DarkTheme extends StatefulWidget {
  const DarkTheme({Key? key}) : super(key: key);

  @override
  State<DarkTheme> createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    final themchanger = Provider.of<ThemChangeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Light and Dark Theme - Provider'),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text('Light Mode'),
            value: ThemeMode.light,
            groupValue: themchanger.themeMode,
            onChanged: themchanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themchanger.themeMode,
            onChanged: themchanger.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themchanger.themeMode,
            onChanged: themchanger.setTheme,
          ),
          const Icon(Icons.add)
        ],
      ),
    );
  }
}

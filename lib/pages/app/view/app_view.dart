import 'package:flutter/material.dart';
import 'package:squad/pages/home/home.dart';
import 'package:squad/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: squadTheme(),
      darkTheme: squadTheme(isDarkMode: true),
      home: const HomeView(),
    );
  }
}

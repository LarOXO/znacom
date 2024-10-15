import 'package:flutter/material.dart';
import 'package:znacom/features/navigation/view/navigation_page.dart';

class Znacom extends StatelessWidget {
  const Znacom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const NavigationPage(),
    );
  }
}

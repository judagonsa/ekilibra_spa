import 'package:ekilibra_spa/app/config/theme/app_theme.dart';
import 'package:ekilibra_spa/app/pages/profile/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme(),
      home: const Profile(),
    );
  }
}

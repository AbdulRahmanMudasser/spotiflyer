import 'package:client/core/theme/theme.dart';
import 'package:client/features/auth/view/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(),
    );
  }
}

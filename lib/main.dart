import 'package:bank_app/core/theme/app_thene.dart';
import 'package:bank_app/screens/main_shell.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BankApp());

class BankApp extends StatelessWidget {
  const BankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const MainShell(),
    );
  }
}

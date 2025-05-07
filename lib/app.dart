import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

class DapprApp extends StatelessWidget {
  const DapprApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dappr Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: const Color(0xFFdfecf2),
      ),
      home: const DashboardScreen(),
    );
  }
}

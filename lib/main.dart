import 'package:flutter/material.dart';
import 'pages/dashboard_page.dart';

void main() => runApp(SaccoDashboardApp());

class SaccoDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SACCO SHIELD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashboardPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
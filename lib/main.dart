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
class ErrorApp extends StatelessWidget {
  final String message;
  const ErrorApp({super.key, required this.message});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 50, color: Colors.red),
              const SizedBox(height: 20),
              Text(
                message,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
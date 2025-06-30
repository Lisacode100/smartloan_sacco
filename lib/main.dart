import 'package:flutter/material.dart';
import 'package:smartloan_sacco/pages/dashboard_page.dart';
import 'package:smartloan_sacco/pages/forgot_password.dart';
import 'package:smartloan_sacco/pages/home_page.dart';
import 'package:smartloan_sacco/pages/login.dart';
import 'package:smartloan_sacco/pages/member_dashboard.dart';
import 'package:smartloan_sacco/pages/register.dart';
import 'package:smartloan_sacco/pages/verification_page.dart';
import 'package:smartloan_sacco/utils/logger.dart';
import 'package:smartloan_sacco/pages/forgot_password.dart';
import 'package:smartloan_sacco/pages/splash_page.dart';





void main() {
  setupLogging();
  runApp(const SaccoDashboardApp());
}

class SaccoDashboardApp extends StatelessWidget {
  const SaccoDashboardApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SACCO SHIELD',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/home',
      routes: {
        
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/forgotpassword':(context)=> ResetPin(),
        '/register': (context) => const RegisterSaccoPage(),
        '/verification': (context) => const VerificationPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/member-dashboard': (context) => const MemberDashboard(
              userName: 'Member',
              email: 'default@member.com',
              currentSavings: 500000, // Placeholder
              outstandingLoan: 120000, // Placeholder
            ),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}




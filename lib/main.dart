// // // import 'package:flutter/material.dart';
// // // import 'package:smartloan_sacco/pages/dashboard_page.dart';
// // // import 'package:smartloan_sacco/pages/forgot_password.dart';
// // // import 'package:smartloan_sacco/pages/home_page.dart';
// // // import 'package:smartloan_sacco/pages/login.dart';
// // // import 'package:smartloan_sacco/pages/member_dashboard.dart';
// // // import 'package:smartloan_sacco/pages/register.dart';
// // // import 'package:smartloan_sacco/pages/verification_page.dart';
// // // import 'package:smartloan_sacco/utils/logger.dart';







// // // void main() {
// // //   setupLogging();
// // //   runApp(const SaccoDashboardApp());
// // // }

// // // class SaccoDashboardApp extends StatelessWidget {
// // //   const SaccoDashboardApp({super.key});
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'SACCO SHIELD',
// // //       theme: ThemeData(primarySwatch: Colors.blue),
// // //       initialRoute: '/home',
// // //       routes: {
        
// // //         '/home': (context) => const HomePage(),
// // //         '/login': (context) => const LoginPage(),
// // //         '/forgotpassword':(context)=> ResetPin(),
// // //         '/register': (context) => const RegisterSaccoPage(),
// // //         '/verification': (context) => const VerificationPage(),
// // //         '/dashboard': (context) => const DashboardPage(),
// // //         '/member-dashboard': (context) => const MemberDashboard(
// // //               userName: 'Member',
// // //               email: 'default@member.com',
// // //               currentSavings: 0, // Placeholder
// // //               loans: [], // Placeholder
// // //             ),
// // //       },
// // //       debugShowCheckedModeBanner: false,
// // //     );
// // //   }
// // // }



// // import 'package:flutter/material.dart';
// // import 'package:smartloan_sacco/pages/dashboard_page.dart';
// // import 'package:smartloan_sacco/pages/home_page.dart';
// // import 'package:smartloan_sacco/pages/login.dart';
// // import 'package:smartloan_sacco/pages/member_dashboard.dart';
// // import 'package:smartloan_sacco/pages/register.dart';
// // import 'package:smartloan_sacco/pages/verification_page.dart';
// // import 'package:smartloan_sacco/utils/logger.dart';


// // void main() {
// //   setupLogging();
// //   runApp(const SaccoDashboardApp());
// // }

// // class SaccoDashboardApp extends StatelessWidget {
// //   const SaccoDashboardApp({super.key});
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'SACCO SHIELD',
// //       theme: ThemeData(primarySwatch: Colors.blue),
// //       initialRoute: '/home',
// //       routes: {
        
// //         '/home': (context) => const HomePage(),
// //         '/login': (context) => const LoginPage(),
// //         '/register': (context) => const RegisterSaccoPage(),
// //         '/verification': (context) => const VerificationPage(),
// //         '/dashboard': (context) => const DashboardPage(),
// //         '/member-dashboard': (context) => const MemberDashboard(
// //               userName: 'Member',
// //               email: 'member@sacco.com',
// //               currentSavings: 0, // Placeholder
// //               loans:  [], // Placeholder for loans list
// //             ),
// //       },
// //       debugShowCheckedModeBanner: false,
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:smartloan_sacco/pages/dashboard_page.dart';
// import 'package:smartloan_sacco/pages/forgot_password.dart';
// import 'package:smartloan_sacco/pages/home_page.dart';
// import 'package:smartloan_sacco/pages/login.dart';
// import 'package:smartloan_sacco/pages/member_dashboard.dart';
// import 'package:smartloan_sacco/pages/register.dart';
// import 'package:smartloan_sacco/pages/verification_page.dart';
// import 'package:smartloan_sacco/models/momo_payment.dart';
// import 'package:smartloan_sacco/models/payment_confirmation.dart';
// import 'package:smartloan_sacco/models/payment_history.dart';
// import 'package:smartloan_sacco/utils/logger.dart';

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   setupLogging();
//   runApp(const SaccoDashboardApp());
// }

// class SaccoDashboardApp extends StatelessWidget {
//   const SaccoDashboardApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SACCO SHIELD',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: 'Roboto',
//       ),
//       initialRoute: '/home',
//       routes: {
//         '/home': (context) => const HomePage(),
//         '/login': (context) => const LoginPage(),
//         '/forgotpassword': (context) => const ResetPin(),
//         '/register': (context) => const RegisterSaccoPage(),
//         '/verification': (context) => const VerificationPage(),
//         '/dashboard': (context) => const DashboardPage(),
//         '/member-dashboard': (context) => const MemberDashboard(
//               userName: 'Member',
//               email: 'member@sacco.com',
//               phoneNumber: '0000000000',
//               currentSavings: 0.0,
//               loans: [],
//               notifications: [],
//             ),
//         '/momo-payment': (context) => MomoPaymentPage(
//               amount: ModalRoute.of(context)!.settings.arguments as double,
//             ),
//         '/payment-confirmation': (context) => PaymentConfirmationPage(
//               transactionData: ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>,
//             ),
//         '/payment-history': (context) => const PaymentHistoryPage(),
//       },
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:smartloan_sacco/pages/forgot_password.dart';
import 'package:smartloan_sacco/pages/home_page.dart';
import 'package:smartloan_sacco/pages/login.dart';
import 'package:smartloan_sacco/pages/member_dashboard.dart';
import 'package:smartloan_sacco/pages/dashboard_page.dart';
import 'package:smartloan_sacco/pages/register.dart';
import 'package:smartloan_sacco/pages/splash_page.dart';
import 'package:smartloan_sacco/pages/verification_page.dart';
import 'package:smartloan_sacco/utils/logger.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: '/splash',
      routes: {
        '/splash':(context)=>SplashPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/forgotpassword': (context) => const ResetPin(),
        '/register': (context) => const RegisterSaccoPage(),
        '/verification': (context) => const VerificationPage(),
        '/member-dashboard': (context) => const MemberDashboard(),
        '/dashboard': (context) => const DashboardPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
// import 'dart:async';
// import 'package:flutter/material.dart';

// class VerificationPage extends StatefulWidget {
//   const VerificationPage({super.key});

//   @override
//   State<VerificationPage> createState() => _VerificationPageState();
// }

// class _VerificationPageState extends State<VerificationPage> {
//   String _verificationCode = '';
//   String _userRole = 'Member'; // Default role
//   final List<String> _codeDigits = List.filled(6, '');

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final args = ModalRoute.of(context)?.settings.arguments;
//     if (args is Map<String, String>) {
//       _verificationCode = args['code'] ?? '';
//       _userRole = args['role'] ?? 'Member';
//       _startAutoFill();
//     }
//   }

//   void _startAutoFill() {
//     Timer.periodic(const Duration(milliseconds: 400), (timer) {
//       if (!mounted) {
//         timer.cancel();
//         return;
//       }
//       final index = timer.tick - 1;
//       if (index < _verificationCode.length) {
//         setState(() {
//           _codeDigits[index] = _verificationCode[index];
//         });
//       } else {
//         timer.cancel();
//         // Wait a bit before navigating to give feedback to the user
//         Future.delayed(const Duration(seconds: 1), () {
//           if (mounted) {
//             Navigator.of(context).pushNamedAndRemoveUntil(
//               '/login',
//               (route) => false,
//               arguments: _userRole,
//             );
//           }
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Phone Verification"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 "Verifying your number",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 "We've sent a code to your phone. The code will be filled automatically.",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               const SizedBox(height: 40),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: _codeDigits.map((digit) {
//                   return Container(
//                     width: 45,
//                     height: 55,
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue, width: 2),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Text(
//                       digit,
//                       style: const TextStyle(
//                           fontSize: 24, fontWeight: FontWeight.bold),
//                     ),
//                   );
//                 }).toList(),
//               ),
//               const SizedBox(height: 40),
//               const CircularProgressIndicator(),
//               const SizedBox(height: 16),
//               const Text("Auto-filling code..."),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  String _verificationCode = '';
  String _userRole = 'Member';
  final List<String> _codeDigits = List.filled(6, '');
  bool _isBlindUser = false;
  final TextEditingController _manualController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is Map<String, String>) {
      _verificationCode = args['code'] ?? '';
      _userRole = args['role'] ?? 'Member';
      _isBlindUser = _userRole.toLowerCase() == 'blind';

      if (_isBlindUser) {
        _startAutoFill();
      }
    }
  }

  void _startAutoFill() {
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      final index = timer.tick - 1;
      if (index < _verificationCode.length) {
        setState(() {
          _codeDigits[index] = _verificationCode[index];
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login',
              (route) => false,
              arguments: _userRole,
            );
          }
        });
      }
    });
  }

  void _verifyManualOtp() {
    if (_manualController.text.length == 6 &&
        _manualController.text == _verificationCode) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (route) => false,
        arguments: _userRole,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid OTP. Please try again.")),
      );
    }
  }

  Widget _buildOtpBox(String digit) {
    return Container(
      width: 45,
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        digit,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verification"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  _isBlindUser ? "Verifying your PIN" : "Enter OTP from Email",
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  _isBlindUser
                      ? "Your verification PIN is being automatically filled."
                      : "Please check your email and enter the 6-digit code.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 30),

                _isBlindUser
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _codeDigits.map(_buildOtpBox).toList(),
                      )
                    : Column(
                        children: [
                          TextField(
                            controller: _manualController,
                            maxLength: 6,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Enter 6-digit OTP",
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: _verifyManualOtp,
                            child: const Text("Verify"),
                          )
                        ],
                      ),

                const SizedBox(height: 30),
                if (_isBlindUser)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text("Auto-filling PIN..."),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

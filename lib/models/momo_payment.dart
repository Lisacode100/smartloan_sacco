import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:smartloan_sacco/services/momo_services.dart';

class MomoPaymentPage extends StatefulWidget {
  final double amount;
  
  const MomoPaymentPage({super.key, required this.amount});

  @override
  State<MomoPaymentPage> createState() => _MomoPaymentPageState();
}

class _MomoPaymentPageState extends State<MomoPaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isLoading = false;
  String? _errorMessage;

  // Initialize with test values in debug mode
  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      _phoneController.text = '775123456'; // Test UG number
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }



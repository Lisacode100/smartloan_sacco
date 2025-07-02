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

  Future<void> _processPayment() async {
    if (!_formKey.currentState!.validate()) return;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    
    try {
      final momoService = MomoService(
        subscriptionKey: 'YOUR_MTN_SUBSCRIPTION_KEY',
        isSandbox: true, // Change to false in production
        callbackUrl: 'https://your-sacco.com/momo-callback',
      );

       final transactionId = MomoService.generateTransactionId();
      
      final result = await momoService.requestPayment(
        phoneNumber: _phoneController.text,
        amount: widget.amount,
        externalId: transactionId,
        payerMessage: 'SACCO Contribution: UGX ${widget.amount.toStringAsFixed(2)}',
      );
      
      if (!mounted) return;
      
      Navigator.pushNamed(
        context,
        '/payment-confirmation',
        arguments: {
          ...result,
          'success': true,
          'message': 'Payment initiated successfully',
        },
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });





import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:smartloan_sacco/services/momo_services.dart';

class MomoPaymentPage extends StatefulWidget {
  final double amount;
  
  const MomoPaymentPage({super.key, required this.amount, required Null Function(dynamic success) onPaymentComplete});

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
       } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MTN Mobile Money Payment'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Pay UGX ${widget.amount.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'MTN Mobile Money Number',
                  prefixText: '+256 ',
                  border: OutlineInputBorder(),
                  hintText: '775123456',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]{9}$').hasMatch(value)) {
                    return 'Enter a valid Uganda number (e.g. 775123456)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),

                 const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isLoading ? null : _processPayment,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Pay with Mobile Money'),
              ),
              const SizedBox(height: 16),
              Text(
                'You will receive a Mobile Money prompt on your phone to confirm the payment',
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}









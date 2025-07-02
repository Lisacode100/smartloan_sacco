import 'package:flutter/material.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;
  
  const PaymentConfirmationPage({
    super.key,
    required this.transactionData,
  });

  @override
  Widget build(BuildContext context) {
    final isSuccess = transactionData['success'] == true;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Confirmation'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error,
              color: isSuccess ? Colors.green : Colors.red,
              size: 80,
            ),
             const SizedBox(height: 24),
            Text(
              isSuccess ? 'Payment Initiated!' : 'Payment Failed',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: isSuccess ? Colors.green : Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              transactionData['message'] ?? 
              (isSuccess ? 'Please complete the payment on your phone' : 'Please try again'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
             const SizedBox(height: 32),
            if (isSuccess) ...[
              _buildDetailRow('Amount:', 'UGX ${transactionData['amount']?.toStringAsFixed(2) ?? '0.00'}'),
              _buildDetailRow('To:', 'SACCO Account'),
              _buildDetailRow('Transaction ID:', transactionData['transactionId'] ?? 'N/A'),
              _buildDetailRow('Phone:', transactionData['phoneNumber'] ?? 'N/A'),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/member-dashboard'));
              },
              child: const Text('Back to Dashboard'),
            ),
          ],
        ),
      ),
    );
  }

   Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(value),
        ],
      ),
    );
  }
}






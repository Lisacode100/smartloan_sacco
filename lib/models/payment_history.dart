import 'package:flutter/material.dart';
import 'package:smartloan_sacco/models/transaction_model.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<Transaction> _transactions = [];
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    try {
      // In a real app, you would fetch these from your backend/database
      await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

      final mockTransactions = [
        Transaction(
          id: 'SACCO${DateTime.now().millisecondsSinceEpoch}',
          amount: 10000,
          date: DateTime.now().subtract(const Duration(days: 1)),
          status: 'Completed',
          type: 'Deposit',
          method: 'Mobile Money',
          phoneNumber: '256775123456',
          reference: 'MTN_REF_123',
        ),
         Transaction(
          id: 'SACCO${DateTime.now().millisecondsSinceEpoch + 1}',
          amount: 5000,
          date: DateTime.now().subtract(const Duration(days: 3)),
          status: 'Failed',
          type: 'Deposit',
          method: 'Mobile Money',
          phoneNumber: '256772987654',
          reference: 'MTN_REF_456',
        ),
        Transaction(
          id: 'SACCO${DateTime.now().millisecondsSinceEpoch + 2}',
           amount: 20000,
          date: DateTime.now().subtract(const Duration(days: 5)),
          status: 'Pending',
          type: 'Deposit',
          method: 'Mobile Money',
          phoneNumber: '256785123456',
          reference: 'MTN_REF_789',
        ),
      ];

      setState(() {
        _transactions = mockTransactions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load transactions: ${e.toString()}';
        _isLoading = false;
      });
    }
  }





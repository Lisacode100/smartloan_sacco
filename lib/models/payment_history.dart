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

   Future<void> _initiateMomoPayment(
      BuildContext context, double amount, String phoneNumber) async {
    try {
      // Simulate API call to your backend
      // Replace this with your actual API call
      await Future.delayed(const Duration(seconds: 2));

      // Create a new transaction
      final newTransaction = Transaction(
        id: 'SACCO${DateTime.now().millisecondsSinceEpoch}',
        amount: amount,
        date: DateTime.now(),
        type: 'Deposit',
        status: 'Pending', // Or 'Processing'
        method: 'Mobile Money',
        phoneNumber: phoneNumber,
        reference: 'MOMO_REF_${DateTime.now().millisecondsSinceEpoch}',
      );
      setState(() {
        _transactions = [newTransaction, ..._transactions];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('MoMo payment initiated!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to initiate MoMo payment: ${e.toString()}')),
      );
    }
  }
  void _showMoMoPaymentDialog(BuildContext context) {
    double amount = 0;
    String phoneNumber = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('MoMo Deposit'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Amount (UGX)'),
                onChanged: (value) => amount = double.tryParse(value) ?? 0,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number (256...)'),
                onChanged: (value) => phoneNumber = value,
              ),
            ],
          ),










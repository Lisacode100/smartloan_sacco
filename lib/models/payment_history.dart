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

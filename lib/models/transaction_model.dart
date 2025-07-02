import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction {
  final String id;
  final double amount;
  final DateTime date;
  final String type; // Deposit, Withdrawal, Loan Payment
  final String status; // Pending, Completed, Failed
  final String method; // Mobile Money, Bank Transfer
  final String? reference;
  final String? phoneNumber;

   Transaction({
    required this.id,
    required this.amount,
    required this.date,
    required this.type,
    required this.status,
    required this.method,
    this.reference,
    this.phoneNumber,
  });

  String getFormattedDate() => DateFormat('MMM d, y').format(date);
  String getAmountText() => NumberFormat.currency(symbol: 'UGX ').format(amount);



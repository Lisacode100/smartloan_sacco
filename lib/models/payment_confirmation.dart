import 'package:flutter/material.dart';

class PaymentConfirmationPage extends StatelessWidget {
  final Map<String, dynamic> transactionData;
  
  const PaymentConfirmationPage({
    super.key,
    required this.transactionData,
  });

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:smartloan_sacco/services/momo_services.dart';

class MomoPaymentPage extends StatefulWidget {
  final double amount;
  
  const MomoPaymentPage({super.key, required this.amount});

  @override
  State<MomoPaymentPage> createState() => _MomoPaymentPageState();
}


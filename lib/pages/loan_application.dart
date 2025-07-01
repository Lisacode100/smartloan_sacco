import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class LoanApplicationScreen extends StatefulWidget {
  final String memberId;
  final double memberSavings;
  final Function(Map<String, dynamic>) onSubmit;

  const LoanApplicationScreen({
    super.key,
    required this.memberId,
    required this.memberSavings,
    required this.onSubmit,
  });

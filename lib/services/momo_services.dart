import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class MomoService {
  static const String _baseSandboxUrl = 'https://sandbox.momodeveloper.mtn.com';
  static const String _baseProductionUrl = 'https://api.mtn.com/v1';
  
  final String subscriptionKey;
  final bool isSandbox;
  final String callbackUrl;
  
  MomoService({
    required this.subscriptionKey,
    this.isSandbox = true,
    required this.callbackUrl,
  });

  Future<Map<String, dynamic>> requestPayment({
    required String phoneNumber,
    required double amount,
    required String externalId,
    required String payerMessage,
  }) async {
    // Ensure phone number is in UG format (256...)
    final formattedPhone = _formatUgandanNumber(phoneNumber);
    
    final url = Uri.parse('${isSandbox ? _baseSandboxUrl : _baseProductionUrl}/collection/v1_0/requesttopay');
    
    final headers = {
      'Authorization': 'Bearer ${await _getAccessToken()}',
      'X-Target-Environment': isSandbox ? 'sandbox' : 'production',
      'Content-Type': 'application/json',
      'Ocp-Apim-Subscription-Key': subscriptionKey,
      'X-Reference-Id': externalId,
      'X-Callback-Url': callbackUrl,
    };
    
    final body = jsonEncode({
      'amount': amount.toStringAsFixed(2),
      'currency': 'UGX',
      'externalId': externalId,
      'payer': {
        'partyIdType': 'MSISDN',
        'partyId': formattedPhone,
      },
      'payerMessage': payerMessage,
      'payeeNote': 'SACCO Contribution Payment',
    });
    
    if (kDebugMode) {
      print('MTN MoMo Request Headers: $headers');
      print('MTN MoMo Request Body: $body');
    }
    
    final response = await http.post(url, headers: headers, body: body);
    
    if (kDebugMode) {
      print('MTN MoMo Response: ${response.statusCode} - ${response.body}');
    }
    
    if (response.statusCode == 202) {
      return {
        'status': 'pending',
        'transactionId': externalId,
        'phoneNumber': formattedPhone,
        'amount': amount,
        'timestamp': DateTime.now().toIso8601String(),
      };
    } else {
      throw Exception('Payment request failed: ${response.body}');
    }
  }

  Future<String> _getAccessToken() async {
    final url = Uri.parse('${isSandbox ? _baseSandboxUrl : _baseProductionUrl}/collection/token/');
    final headers = {
      'Ocp-Apim-Subscription-Key': subscriptionKey,
    };
    
    final response = await http.post(url, headers: headers);
    
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['access_token'];
    } else {
      throw Exception('Failed to get access token: ${response.body}');
    }
  }

  String _formatUgandanNumber(String phoneNumber) {
    // Convert various formats to 25677XXXXXXX
    final cleaned = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleaned.startsWith('0')) {
      return '256${cleaned.substring(1)}';
    } else if (cleaned.startsWith('+256')) {
      return cleaned.substring(1);
    } else if (cleaned.length == 9 && cleaned.startsWith('7')) {
      return '256$cleaned';
    }
    return cleaned;
  }

  static String generateTransactionId() {
    final random = Random();
    return 'SACCO${DateTime.now().millisecondsSinceEpoch}${random.nextInt(900) + 100}';
  }
}
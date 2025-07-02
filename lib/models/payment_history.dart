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
           actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _initiateMomoPayment(context, amount, phoneNumber);
              },
              child: const Text('Deposit'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadTransactions,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMoMoPaymentDialog(context),
        tooltip: 'Deposit via MoMo',
        child: const Icon(Icons.monetization_on),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
      if (_errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_errorMessage),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadTransactions,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_transactions.isEmpty) {
      return const Center(
        child: Text('No transactions found'),
      );
    }

     return ListView.builder(
      itemCount: _transactions.length,
      itemBuilder: (context, index) {
        final transaction = _transactions[index];
        return _buildTransactionCard(transaction);
      },
    );
  }

  Widget _buildTransactionCard(Transaction transaction) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => _showTransactionDetails(transaction),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    transaction.getAmountText(),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: transaction.getStatusColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      transaction.status,
                      style: TextStyle(
                        color: transaction.getStatusColor(),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Type: ${transaction.type}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Date: ${transaction.getFormattedDate()}',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 4),
              Text(
                'Method: ${transaction.method}',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _showTransactionDetails(Transaction transaction) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Transaction Details',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Transaction ID:', transaction.id),
              _buildDetailRow('Amount:', transaction.getAmountText()),
              _buildDetailRow('Status:', transaction.status),
              _buildDetailRow('Type:', transaction.type),
              _buildDetailRow('Date:', transaction.getFormattedDate()),
              _buildDetailRow('Payment Method:', transaction.method),
              if (transaction.phoneNumber != null)
                _buildDetailRow('Phone Number:', transaction.phoneNumber!),
              if (transaction.reference != null)
                _buildDetailRow('Reference:', transaction.reference!),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
            ],
             ),
        );
      },
    );
  }





















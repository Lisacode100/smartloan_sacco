// // ignore_for_file: deprecated_member_use, use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:smartloan_sacco/models/transaction_model.dart';

// class PaymentHistoryPage extends StatefulWidget {
//   const PaymentHistoryPage({super.key});

//   @override
//   State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
// }

// class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
//   List<Transaction> _transactions = [];
//   bool _isLoading = true;
//   String _errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     _loadTransactions();
//   }

//   Future<void> _loadTransactions() async {
//     try {
//       // In a real app, you would fetch these from your backend/database
//       await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

//       final mockTransactions = [
//         Transaction(
//           id: 'SACCO${DateTime.now().millisecondsSinceEpoch}',
//           amount: 10000,
//           date: DateTime.now().subtract(const Duration(days: 1)),
//           status: 'Completed',
//           type: 'Deposit',
//           method: 'Mobile Money',
//           phoneNumber: '256775123456',
//           reference: 'MTN_REF_123',
//         ),
//          Transaction(
//           id: 'SACCO${DateTime.now().millisecondsSinceEpoch + 1}',
//           amount: 5000,
//           date: DateTime.now().subtract(const Duration(days: 3)),
//           status: 'Failed',
//           type: 'Deposit',
//           method: 'Mobile Money',
//           phoneNumber: '256772987654',
//           reference: 'MTN_REF_456',
//         ),
//         Transaction(
//           id: 'SACCO${DateTime.now().millisecondsSinceEpoch + 2}',
//            amount: 20000,
//           date: DateTime.now().subtract(const Duration(days: 5)),
//           status: 'Pending',
//           type: 'Deposit',
//           method: 'Mobile Money',
//           phoneNumber: '256785123456',
//           reference: 'MTN_REF_789',
//         ),
//       ];

//       setState(() {
//         _transactions = mockTransactions;
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _errorMessage = 'Failed to load transactions: ${e.toString()}';
//         _isLoading = false;
//       });
//     }
//   }

//    Future<void> _initiateMomoPayment(
//       BuildContext context, double amount, String phoneNumber) async {
//     try {
//       // Simulate API call to your backend
//       // Replace this with your actual API call
//       await Future.delayed(const Duration(seconds: 2));

//       // Create a new transaction
//       final newTransaction = Transaction(
//         id: 'SACCO${DateTime.now().millisecondsSinceEpoch}',
//         amount: amount,
//         date: DateTime.now(),
//         type: 'Deposit',
//         status: 'Pending', // Or 'Processing'
//         method: 'Mobile Money',
//         phoneNumber: phoneNumber,
//         reference: 'MOMO_REF_${DateTime.now().millisecondsSinceEpoch}',
//       );
//       setState(() {
//         _transactions = [newTransaction, ..._transactions];
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('MoMo payment initiated!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to initiate MoMo payment: ${e.toString()}')),
//       );
//     }
//   }
//   void _showMoMoPaymentDialog(BuildContext context) {
//     double amount = 0;
//     String phoneNumber = '';

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('MoMo Deposit'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(labelText: 'Amount (UGX)'),
//                 onChanged: (value) => amount = double.tryParse(value) ?? 0,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.phone,
//                 decoration: const InputDecoration(labelText: 'Phone Number (256...)'),
//                 onChanged: (value) => phoneNumber = value,
//               ),
//             ],
//           ),
//            actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 _initiateMomoPayment(context, amount, phoneNumber);
//               },
//               child: const Text('Deposit'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment History'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: _loadTransactions,
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => _showMoMoPaymentDialog(context),
//         tooltip: 'Deposit via MoMo',
//         child: const Icon(Icons.monetization_on),
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//       if (_errorMessage.isNotEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(_errorMessage),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: _loadTransactions,
//               child: const Text('Retry'),
//             ),
//           ],
//         ),
//       );
//     }

//     if (_transactions.isEmpty) {
//       return const Center(
//         child: Text('No transactions found'),
//       );
//     }

//      return ListView.builder(
//       itemCount: _transactions.length,
//       itemBuilder: (context, index) {
//         final transaction = _transactions[index];
//         return _buildTransactionCard(transaction);
//       },
//     );
//   }

//   Widget _buildTransactionCard(Transaction transaction) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//       child: InkWell(
//         onTap: () => _showTransactionDetails(transaction),
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     transaction.getAmountText(),
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 8,
//                       vertical: 4,
//                     ),
//                     decoration: BoxDecoration(
//                       color: transaction.getStatusColor().withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Text(
//                       transaction.status,
//                       style: TextStyle(
//                         color: transaction.getStatusColor(),
//                         fontSize: 12,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),
//               Text(
//                 'Type: ${transaction.type}',
//                 style: const TextStyle(fontSize: 14),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Date: ${transaction.getFormattedDate()}',
//                 style: const TextStyle(fontSize: 14),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 'Method: ${transaction.method}',
//                 style: const TextStyle(fontSize: 14),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   void _showTransactionDetails(Transaction transaction) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   'Transaction Details',
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _buildDetailRow('Transaction ID:', transaction.id),
//               _buildDetailRow('Amount:', transaction.getAmountText()),
//               _buildDetailRow('Status:', transaction.status),
//               _buildDetailRow('Type:', transaction.type),
//               _buildDetailRow('Date:', transaction.getFormattedDate()),
//               _buildDetailRow('Payment Method:', transaction.method),
//               if (transaction.phoneNumber != null)
//                 _buildDetailRow('Phone Number:', transaction.phoneNumber!),
//               if (transaction.reference != null)
//                 _buildDetailRow('Reference:', transaction.reference!),
//               const SizedBox(height: 24),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('Close'),
//                 ),
//               ),
//             ],
//              ),
//         );
//       },
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: 120,
//             child: Text(
//               label,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ),
//           const SizedBox(width: 8),
//           Expanded(child: Text(value)),
//         ],
//       ),
//     );
// }
// }



// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:smartloan_sacco/models/deposit_model.dart';

class PaymentHistoryPage extends StatefulWidget {
  const PaymentHistoryPage({super.key});

  @override
  State<PaymentHistoryPage> createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<Deposit> _deposits = [];
  bool _isLoading = true;
  String _errorMessage = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDeposits();
  }

  Future<void> _loadDeposits() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        _deposits = [
          Deposit(
            id: 'DEP-${DateTime.now().millisecondsSinceEpoch}',
            amount: 100000,
            date: DateTime.now().subtract(const Duration(days: 1)),
            method: 'Mobile Money',
            status: 'Completed',
            reference: 'MM-REF-12345',
            phoneNumber: '256775123456',
          ),
          Deposit(
            id: 'DEP-${DateTime.now().millisecondsSinceEpoch + 1}',
            amount: 50000,
            date: DateTime.now().subtract(const Duration(days: 3)),
            method: 'Bank Transfer',
            status: 'Pending',
            reference: 'BANK-REF-67890',
          ),
          Deposit(
            id: 'DEP-${DateTime.now().millisecondsSinceEpoch + 2}',
            amount: 200000,
            date: DateTime.now().subtract(const Duration(days: 5)),
            method: 'Mobile Money',
            status: 'Failed',
            reference: 'MM-REF-54321',
            phoneNumber: '256772987654',
          ),
        ];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load deposits: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  Future<void> _initiateMomoPayment(BuildContext context) async {
    final amountController = TextEditingController();
    final phoneController = TextEditingController();

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Mobile Money Deposit'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Amount (UGX)',
                prefixText: 'UGX ',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter amount';
                final amount = double.tryParse(value) ?? 0;
                if (amount <= 0) return 'Amount must be positive';
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                hintText: '256XXXXXXXXX',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter phone number';
                if (!value.startsWith('256') || value.length != 12) {
                  return 'Enter valid UG number (256XXXXXXXXX)';
                }
                return null;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (amountController.text.isEmpty || phoneController.text.isEmpty) {
                return;
              }
              Navigator.pop(context, true);
            },
            child: const Text('Proceed'),
          ),
        ],
      ),
    );

    if (result == true) {
      final amount = double.parse(amountController.text);
      final phone = phoneController.text;

      // Simulate payment processing
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));

      final newDeposit = Deposit(
        id: 'DEP-${DateTime.now().millisecondsSinceEpoch}',
        amount: amount,
        date: DateTime.now(),
        method: 'Mobile Money',
        status: 'Pending',
        reference: 'MM-${DateTime.now().millisecondsSinceEpoch}',
        phoneNumber: phone,
      );

      setState(() {
        _deposits.insert(0, newDeposit);
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment initiated successfully!')),
      );
    }
  }

  List<Deposit> get _filteredDeposits {
    if (_searchController.text.isEmpty) return _deposits;
    return _deposits.where((deposit) {
      return deposit.id.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          deposit.reference.toLowerCase().contains(_searchController.text.toLowerCase()) ||
          (deposit.phoneNumber?.toLowerCase().contains(_searchController.text.toLowerCase()) ?? false) ||
          deposit.amount.toString().contains(_searchController.text);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deposit History'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadDeposits,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _initiateMomoPayment(context),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search deposits',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => setState(() {}),
            ),
          ),
          Expanded(
            child: _buildBody(),
          ),
        ],
      ),
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
              onPressed: _loadDeposits,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_filteredDeposits.isEmpty) {
      return const Center(child: Text('No deposits found'));
    }

    return ListView.builder(
      itemCount: _filteredDeposits.length,
      itemBuilder: (context, index) {
        final deposit = _filteredDeposits[index];
        return _buildDepositCard(deposit);
      },
    );
  }

  Widget _buildDepositCard(Deposit deposit) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: InkWell(
        onTap: () => _showDepositDetails(deposit),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    deposit.getAmountText(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: deposit.getStatusColor().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      deposit.status.toUpperCase(),
                      style: TextStyle(
                        color: deposit.getStatusColor(),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text('Method: ${deposit.method}'),
              const SizedBox(height: 4),
              Text('Date: ${deposit.getFormattedDate()}'),
              if (deposit.phoneNumber != null) ...[
                const SizedBox(height: 4),
                Text('Phone: ${deposit.phoneNumber}'),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _showDepositDetails(Deposit deposit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Deposit Details',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 16),
              _buildDetailRow('Deposit ID:', deposit.id),
              _buildDetailRow('Amount:', deposit.getAmountText()),
              _buildDetailRow('Status:', deposit.status),
              _buildDetailRow('Method:', deposit.method),
              _buildDetailRow('Date:', deposit.getFormattedDate()),
              if (deposit.phoneNumber != null)
                _buildDetailRow('Phone:', deposit.phoneNumber!),
              _buildDetailRow('Reference:', deposit.reference),
              const SizedBox(height: 24),
              Center(
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Close'),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}


















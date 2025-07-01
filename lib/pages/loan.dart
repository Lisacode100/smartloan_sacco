class Loan {
  final String id;
  final double amount;
  final double remainingBalance;
  final DateTime disbursementDate;
  final DateTime dueDate;
  final String status;
  final String type;
  final List<Payment> payments;

    Loan({
    required this.id,
    required this.amount,
    required this.remainingBalance,
    required this.disbursementDate,
    required this.dueDate,
    required this.status,
    required this.type,
    this.payments = const [],
  });


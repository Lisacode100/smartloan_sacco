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

  factory Loan.fromJson(Map<String, dynamic> json) {
    return Loan(
      id: json['id'],
      amount: json['amount'].toDouble(),
      remainingBalance: json['remainingBalance'].toDouble(),
      disbursementDate: DateTime.parse(json['disbursementDate']),
      dueDate: DateTime.parse(json['dueDate']),
      status: json['status'],
      type: json['type'],
      payments: (json['payments'] as List)
          .map((p) => Payment.fromJson(p))
          .toList(),
    );
  }
}

class Payment {
  final double amount;
  final DateTime date;
  final String reference;

  Payment({
    required this.amount,
    required this.date,
    required this.reference,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      reference: json['reference'],
    );
  }
}



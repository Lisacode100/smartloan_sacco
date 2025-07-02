class Deposit {
  final String id;
  final double amount;
  final DateTime date;
  final String method;
  final String status;
  final String reference;

    Deposit({
    required this.id,
    required this.amount,
    required this.date,
    required this.method,
    required this.status,
    required this.reference,
  });

  factory Deposit.fromJson(Map<String, dynamic> json) {
    return Deposit(
      id: json['id'],
      amount: json['amount'].toDouble(),
      date: DateTime.parse(json['date']),
      method: json['method'],
      status: json['status'],
      reference: json['reference'],
    );
  }
}



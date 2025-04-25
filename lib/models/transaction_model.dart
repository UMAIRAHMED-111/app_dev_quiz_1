import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  final String name;
  final double amount;
  final DateTime date;

  TransactionModel({
    required this.name,
    required this.amount,
    required this.date,
  });

  factory TransactionModel.fromFirestore(Map<String, dynamic> data) {
    return TransactionModel(
      name: data['name'] ?? '',
      amount: (data['amount'] as num).toDouble(),
      date: (data['date'] as Timestamp).toDate(),
    );
  }
}

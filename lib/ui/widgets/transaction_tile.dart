import 'package:flutter/material.dart';
import '../../models/transaction_model.dart';
import '../../utils/date_utils.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel tx;

  const TransactionTile({super.key, required this.tx});

  @override
  Widget build(BuildContext context) {
    final isCredit = tx.amount > 0;
    final amountText = "${isCredit ? '+' : '-'}\$${tx.amount.abs().toStringAsFixed(0)}";

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(12), // rounded square
        ),
        child: Icon(
          _getIconFor(tx.name),
          color: Colors.blue,
          size: 28,
        ),
      ),
      title: Text(
        tx.name,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(formatDate(tx.date)),
      trailing: Text(
        amountText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: isCredit ? Colors.blue : Colors.red,
          fontSize: 16,
        ),
      ),
    );
  }

  IconData _getIconFor(String category) {
    switch (category.toLowerCase()) {
      case "shopping":
        return Icons.shopping_bag;
      case "grocery":
        return Icons.shopping_cart;
      case "transport":
        return Icons.directions_car;
      case "payment":
        return Icons.receipt_long;
      default:
        return Icons.account_balance_wallet;
    }
  }
}

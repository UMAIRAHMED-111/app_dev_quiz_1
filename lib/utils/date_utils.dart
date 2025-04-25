String formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final txDate = DateTime(date.year, date.month, date.day);

  if (txDate == today) return 'Today';
  if (txDate == today.subtract(const Duration(days: 1))) return 'Yesterday';

  return '${txDate.day} ${_month(txDate.month)} ${txDate.year}';
}

String _month(int m) => [
  '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
][m];

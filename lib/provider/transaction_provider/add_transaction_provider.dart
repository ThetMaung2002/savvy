import 'package:flutter/material.dart';
import 'package:savvy/model/transaction_model/transaction.dart';

class TransactionProvider extends ChangeNotifier {
  late final List<Transaction>? _transactions;

  List<Transaction> get transactions =>
      List.unmodifiable(_transactions as Iterable);

  void addTransaction(num amount, String title) {
    final uniqueId = UniqueKey().toString();
    final newTransaction = Transaction(
      id: uniqueId,
      amount: amount,
      title: title,
    );
    _transactions?.add(newTransaction);
    notifyListeners();
  }
}

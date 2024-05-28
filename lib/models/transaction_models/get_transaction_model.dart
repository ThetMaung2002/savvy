import 'package:cloud_firestore/cloud_firestore.dart';

class GetTransacionModel {
  final double amount;
  final String description;
  final Timestamp timestamp;

  GetTransacionModel({
    required this.amount,
    required this.description,
    required this.timestamp,
  });

  factory GetTransacionModel.fromMap(Map<String, dynamic> map) {
    return GetTransacionModel(
      amount: map['amount'],
      description: map['description'],
      timestamp: map['timestamp'],
    );
  }
}

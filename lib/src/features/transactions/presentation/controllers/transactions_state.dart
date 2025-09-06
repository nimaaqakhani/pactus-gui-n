import 'package:flutter/foundation.dart';

@immutable
class TransactionsState {
  final String txTypeValue;
  final List<String> txTypes;
  final String sender;
  final List<String> senders;
  final String recipient;
  final String memo;
  final double amount;
  final double available;
  final double fee;
  final int currentStep;

  const TransactionsState({
    required this.txTypeValue,
    required this.txTypes,
    required this.sender,
    required this.senders,
    required this.recipient,
    required this.memo,
    required this.amount,
    required this.available,
    required this.fee,
    required this.currentStep,
  });

  TransactionsState copyWith({
    String? txTypeValue,
    List<String>? txTypes,
    String? sender,
    List<String>? senders,
    String? recipient,
    String? memo,
    double? amount,
    double? available,
    double? fee,
    int? currentStep,
  }) {
    return TransactionsState(
      txTypeValue: txTypeValue ?? this.txTypeValue,
      txTypes: txTypes ?? this.txTypes,
      sender: sender ?? this.sender,
      senders: senders ?? this.senders,
      recipient: recipient ?? this.recipient,
      memo: memo ?? this.memo,
      amount: amount ?? this.amount,
      available: available ?? this.available,
      fee: fee ?? this.fee,
      currentStep: currentStep ?? this.currentStep,
    );
  }

  static TransactionsState initial() => const TransactionsState(
    txTypeValue: 'transfer',
    txTypes: ['transfer', 'bond'],
    sender: 'pc1z0ugx5majxss6f514ayekg24ndhu0qnaz6r3ak',
    senders: [
      'pc1z0ugx5majxss6f514ayekg24ndhu0qnaz6r3ak',
      'pc1abcdefgh1234567890qwerty0987654321'
    ],
    recipient: '',
    memo: '',
    amount: 0.0,
    available: 175.541,
    fee: 0.8,
    currentStep: 0,
  );
}

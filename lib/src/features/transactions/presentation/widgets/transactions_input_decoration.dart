import 'package:flutter/material.dart';
import '../styles/transactions_ui_palette.dart';

InputDecoration baseDecoration({
  String? hintText,
  Widget? suffix,
  String? suffixText,
}) {
  return InputDecoration(
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    hintText: hintText,
    hintStyle: const TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      color: TransactionsUiPalette.muted,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    floatingLabelBehavior: FloatingLabelBehavior.never,

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        color: TransactionsUiPalette.border,
        width: 1,
      ),
    ),

    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: TransactionsUiPalette.blue,
        width: 2,
      ),
    ),

    suffixIcon: suffix,
    suffixText: suffixText,
    suffixStyle: const TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 20 / 14,
      color: TransactionsUiPalette.muted,
    ),
    counterText: '',
  );
}

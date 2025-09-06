import 'package:flutter/material.dart';
import '../styles/transactions_ui_palette.dart';

class TransactionsLabeledRowWidget extends StatelessWidget {
  final String label;
  final bool requiredMark;
  final EdgeInsets margin;
  final Widget child;

  const TransactionsLabeledRowWidget({
    super.key,
    required this.label,
    required this.child,
    this.requiredMark = false,
    this.margin = const EdgeInsets.only(bottom: 21),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: TransactionsUiPalette.labelWidth,
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  height: 20 / 14,
                  color: TransactionsUiPalette.text,
                ),
                children: requiredMark
                    ? const [
                  TextSpan(
                    text: ' *',
                    style: TextStyle(color: Colors.red),
                  )
                ]
                    : const [],
              ),
            ),
          ),
          const SizedBox(width: 16),
          SizedBox(
            width: 428,
            child: child,
          ),
        ],
      ),
    );
  }
}

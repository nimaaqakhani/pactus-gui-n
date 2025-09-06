import 'package:flutter/material.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart' show AppTheme;

class TransactionsMemoInputWidget extends StatelessWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final Color muted;
  final InputDecoration Function({
  String? hintText,
  Widget? suffix,
  }) decor;

  const TransactionsMemoInputWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.muted,
    required this.decor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      maxLength: 64,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: decor(
        suffix: Padding(
          padding: const EdgeInsets.only(right: 8, top: 6),
          child: Text(
            '${value.length}/64',
            style: AppTheme.of(context).typography.bodyStrong?.copyWith(
              color: const Color(0xFF9D9D9D),
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ),
      ).copyWith(
        isDense: true,
        counterText: '',
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    );
  }
}

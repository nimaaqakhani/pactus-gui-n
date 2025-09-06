import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionsSenderDropdownWidget extends StatelessWidget {
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Color iconColor;
  final InputDecoration Function({
  String? hintText,
  Widget? suffix,
  }) decor;

  const TransactionsSenderDropdownWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.iconColor,
    required this.decor,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map((e) => DropdownMenuItem(
        value: e,
        child: Text(
          e,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ))
          .toList(),
      onChanged: (v) {
        if (v != null) {
          onChanged(v);
        }
      },
      decoration: decor(),
      icon: SvgPicture.asset(
        'assets/icons/ic_arrow_down.svg',
        width: 25,
        height: 25,
        color: iconColor,
      ),
    );
  }
}

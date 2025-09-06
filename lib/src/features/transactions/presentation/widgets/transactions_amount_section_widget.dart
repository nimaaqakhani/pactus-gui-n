import 'package:flutter/material.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import '../../../../core/utils/gen/localization/locale_keys.dart';
import '../styles/transactions_ui_palette.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class TransactionsAmountSectionWidget extends StatefulWidget {
  final double amount;
  final double available;
  final ValueChanged<double> onChanged;
  final VoidCallback onMaxPressed;
  final InputDecoration Function({
  String? hintText,
  Widget? suffix,
  String? suffixText,
  }) decor;
  final Color blue;
  final Color muted;

  const TransactionsAmountSectionWidget({
    super.key,
    required this.amount,
    required this.available,
    required this.onChanged,
    required this.onMaxPressed,
    required this.decor,
    required this.blue,
    required this.muted,
  });

  @override
  State<TransactionsAmountSectionWidget> createState() => _TransactionsAmountSectionWidgetState();
}

class _TransactionsAmountSectionWidgetState extends State<TransactionsAmountSectionWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.amount.toString());
  }

  @override
  void didUpdateWidget(covariant TransactionsAmountSectionWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.amount != widget.amount &&
        widget.amount.toString() != _controller.text) {
      _controller.text = widget.amount.toString();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleMax() {
    final maxValue = widget.available;
    _controller.text = maxValue.toStringAsFixed(3);
    widget.onChanged(maxValue);
    widget.onMaxPressed();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 32,
                child: TextFormField(
                  controller: _controller,
                  onChanged: (val) =>
                      widget.onChanged(double.tryParse(val) ?? 0.0),
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 20 / 14,
                    color: TransactionsUiPalette.text,
                  ),
                  decoration: widget.decor().copyWith(
                    suffixText: context.tr(LocaleKeys.pac),
                    suffixStyle: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: TransactionsUiPalette.muted,
                    ),
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 24,
                child: ElevatedButton(
                  onPressed: _handleMax,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.blue,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    minimumSize: const Size(0, 24),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Max',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Text(
          "${context.tr(LocaleKeys.available)}: "
              "${widget.available.toStringAsFixed(3)} ${context.tr(LocaleKeys.pac)}",
          style: TextStyle(
            color: AppTheme.of(context).extension<PanePallet>()!.itemColor,
            fontSize: 7,
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class TransactionsFeeSectionWidget extends StatelessWidget {

  const TransactionsFeeSectionWidget({
    super.key,
    required this.fee,
    required this.muted,
    required this.decor,
  });
  final double fee;
  final Color muted;
  final InputDecoration Function({
  String? hintText,
  Widget? suffix,
  }) decor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 32,
          child: TextFormField(
            initialValue: fee.toString(),
            readOnly: true,
            textAlignVertical: TextAlignVertical.center,
            decoration: decor(
              suffix: Padding(
                padding: const EdgeInsets.only(right: 8, top: 6),
                child: Text(
                  context.tr(LocaleKeys.pac),
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: AppTheme.of(context).extension<PanePallet>()!.itemColor,
                  ),
                ),
              ),
            ).copyWith(
              isDense: true,
              counterText: '',
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            ),
          ),
        ),
        const SizedBox(height: 1),
        Text(
          "${context.tr(LocaleKeys.fee)}: $fee ${context.tr(LocaleKeys.pac)}",
          style: TextStyle(
            color: AppTheme.of(context).extension<PanePallet>()!.itemColor,
            fontSize: 7,
          ),
        ),
      ],
    );
  }
}

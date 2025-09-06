import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class TransactionsTxPickerDialogWidget extends StatelessWidget {

  const TransactionsTxPickerDialogWidget({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    required this.iconColor,
    required this.decor,
  });
  final String value;
  final List<String> items;
  final ValueChanged<String> onChanged;
  final Color iconColor;
  final InputDecoration Function({String? hintText, Widget? suffix}) decor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      items: items
          .map(
            (e) => DropdownMenuItem(
          value: e,
          child: Text(
            e == 'transfer'
                ? context.tr(LocaleKeys.transfer)
                : context.tr(LocaleKeys.bond),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppTheme.of(context).extension<PanePallet>()!.itemColor,
            ),
          ),
        ),
      )
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

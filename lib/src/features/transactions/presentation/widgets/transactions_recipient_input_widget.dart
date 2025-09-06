import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart' show AppTheme;

class TransactionsRecipientInputWidget extends StatefulWidget {
  final String value;
  final ValueChanged<String> onChanged;
  final Color blue;
  final InputDecoration Function({String? hintText, Widget? suffix}) decor;

  const TransactionsRecipientInputWidget({
    super.key,
    required this.value,
    required this.onChanged,
    required this.blue,
    required this.decor,
  });

  @override
  State<TransactionsRecipientInputWidget> createState() => _TransactionsRecipientInputWidgetState();
}

class _TransactionsRecipientInputWidgetState extends State<TransactionsRecipientInputWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant TransactionsRecipientInputWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value && widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handlePaste() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final pasted = data?.text ?? '';
    if (pasted.isNotEmpty) {
      _controller.text = pasted;
      widget.onChanged(pasted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onChanged: widget.onChanged,
      textAlignVertical: TextAlignVertical.center,
      decoration: widget
          .decor(
            hintText: context.tr(LocaleKeys.recipient),
            suffix: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _handlePaste,
                  child: Text(
                    context.tr(LocaleKeys.paste),
                    style: AppTheme.of(context).typography.bodyLarge?.copyWith(
                      color: AppTheme.of(context).accentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset(
                  'assets/icons/ic_QR_Code.svg',
                  width: 16,
                  height: 16,
                ),
                const SizedBox(width: 8),
              ],
            ),
          )
          .copyWith(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          ),
    );
  }
}

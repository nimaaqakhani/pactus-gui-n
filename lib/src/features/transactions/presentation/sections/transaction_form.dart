import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/core/utils/gen/localization/locale_keys.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/controllers/transactions_state.dart';
import 'package:pactus_gui/src/features/transactions/presentation/transaction_cubit/transaction_cubit.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_amount_section_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_fee_section_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_input_decoration.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_memo_input_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_recipient_input_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_sender_dropdown_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_stepper_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_labeled_row_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_tx_picker_dialog_widget.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class TransactionForm extends StatelessWidget {
  const TransactionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsCubit, TransactionsState>(
      builder: (context, state) {
        final cubit = context.read<TransactionsCubit>();
        final paneTheme = AppTheme.of(context).extension<PanePallet>()!;
        final accent = Theme.of(context).colorScheme.primary;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionStepperWidget(currentStep: state.currentStep),
            const SizedBox(height: 91),
            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.transaction_type),
              child: SizedBox(
                height: 32,
                child: TransactionsTxPickerDialogWidget(
                  value: state.txTypeValue,
                  items: state.txTypes,
                  onChanged: cubit.changeTxType,
                  iconColor: paneTheme.disableColor!,
                  decor: baseDecoration,
                ),
              ),
            ),
            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.sender),
              child: SizedBox(
                height: 32,
                child: TransactionsSenderDropdownWidget(
                  value: state.sender,
                  items: state.senders,
                  onChanged: cubit.changeSender,
                  iconColor: paneTheme.disableColor!,
                  decor: baseDecoration,
                ),
              ),
            ),
            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.recipient),
              requiredMark: true,
              child: SizedBox(
                height: 32,
                child: TransactionsRecipientInputWidget(
                  value: state.recipient,
                  onChanged: cubit.changeRecipient,
                  blue: accent,
                  decor: baseDecoration,
                ),
              ),
            ),
            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.memo),
              child: SizedBox(
                height: 32,
                child: TransactionsMemoInputWidget(
                  value: state.memo,
                  onChanged: cubit.changeMemo,
                  muted: paneTheme.disableColor!,
                  decor: baseDecoration,
                ),
              ),
            ),
            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.amount),
              child: TransactionsAmountSectionWidget(
                amount: state.amount,
                available: state.available,
                onChanged: cubit.changeAmount,
                blue: accent,
                muted: paneTheme.disableColor!,
                decor: baseDecoration,
                onMaxPressed: () {},
              ),
            ),

            TransactionsLabeledRowWidget(
              label: context.tr(LocaleKeys.fee),
              child: TransactionsFeeSectionWidget(
                fee: state.fee,
                muted: paneTheme.disableColor!,
                decor: baseDecoration,
              ),
            ),
          ],
        );
      },
    );
  }
}

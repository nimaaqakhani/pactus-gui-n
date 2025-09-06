import 'package:flutter/material.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_step_item_widget.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transactions_stepper_fancy_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionStepperWidget extends StatelessWidget {

  const TransactionStepperWidget({super.key, required this.currentStep});
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        margin: const EdgeInsets.only(left: 180),
        child: TransactionsStepperFancyWidget(
          currentStep: currentStep,
        steps: [
          TransactionStepItemWidget('Transaction', (color) => SvgPicture.asset(
          'assets/icons/ic_transaction_steper.svg',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        )),
          TransactionStepItemWidget('Confirm', (color) => SvgPicture.asset(
          'assets/icons/ic_confirm_steper.svg',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        )),
          TransactionStepItemWidget('Result', (color) => SvgPicture.asset(
          'assets/icons/ic_result_steper.svg',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        )),
        ],

      ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pactus_gui/src/features/transactions/presentation/widgets/transaction_step_item_widget.dart';

class TransactionsStepperFancyWidget extends StatelessWidget {
  const TransactionsStepperFancyWidget({
    super.key,
    required this.currentStep,
    required this.steps,
    this.width = 300,
  });

  final int currentStep;
  final List<TransactionStepItemWidget> steps;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(steps.length * 2 - 1, (index) {
          if (index.isEven) {
            final stepIndex = index ~/ 2;
            final isActive = stepIndex == currentStep;

            final borderColor =
            isActive ? Colors.blue : Colors.grey.shade400;
            final iconColor =
            isActive ? Colors.blue : Colors.grey.shade600;

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: SizedBox(
                    width: 16,
                    height: 16,
                    child: steps[stepIndex].iconBuilder(iconColor),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  steps[stepIndex].label,
                  style: TextStyle(
                    fontWeight:
                    isActive ? FontWeight.bold : FontWeight.normal,
                    color: iconColor,
                  ),
                ),
              ],
            );
          } else {
            return Expanded(
              child: CustomPaint(
                painter: DottedLinePainter(),
              ),
            );
          }
        }),
      ),
    );
  }
}

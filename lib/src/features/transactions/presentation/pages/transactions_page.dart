import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/main/language/core/localization_extension.dart';
import 'package:pactus_gui/src/features/transactions/presentation/transaction_cubit/transaction_cubit.dart';
import '../../../../core/utils/gen/localization/locale_keys.dart';
import '../sections/transaction_form.dart';
import 'package:pactus_gui_widgetbook/app_styles.dart'
    show AppTheme, PanePallet;

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final panePallet = AppTheme.of(context).extension<PanePallet>()!;

    return BlocProvider(
      create: (_) => TransactionsCubit(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFBFC),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 800),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TransactionForm(),
                  ],
                ),
              ),
            ),
          ),
        ),

        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE0E0E0))),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 3)],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 97,
                height: 32,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0066B4),
                    foregroundColor: const Color(0xFFFFFFFF),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    final cubit = context.read<TransactionsCubit>();
                    if (cubit.isValid()) {
                      cubit.nextStep();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please complete the form')),
                      );
                    }
                  },
                  child: Text(
                    context.tr(LocaleKeys.next),
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

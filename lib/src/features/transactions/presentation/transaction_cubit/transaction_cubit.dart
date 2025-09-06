import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pactus_gui/src/features/transactions/presentation/controllers/transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  TransactionsCubit() : super(TransactionsState.initial());

  void changeTxType(String type) {
    emit(state.copyWith(txTypeValue: type));
  }

  void changeSender(String sender) {
    emit(state.copyWith(sender: sender));
  }

  void changeRecipient(String recipient) {
    emit(state.copyWith(recipient: recipient));
  }

  void changeMemo(String memo) {
    emit(state.copyWith(memo: memo));
  }

  void changeAmount(double amount) {
    emit(state.copyWith(amount: amount));
  }

  void setMaxAmount() {
    emit(state.copyWith(amount: state.available));
  }

  void updateAvailable(double available) {
    emit(state.copyWith(available: available));
  }

  void updateFee(double fee) {
    emit(state.copyWith(fee: fee));
  }

  void nextStep() {
    emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void previousStep() {
    if (state.currentStep > 0) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  bool isValid() {
    return state.recipient.isNotEmpty && state.amount > 0;
  }
}

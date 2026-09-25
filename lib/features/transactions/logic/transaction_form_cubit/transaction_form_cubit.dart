import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';

part 'transaction_form_state.dart';

class TransactionFormCubit extends Cubit<TransactionFormState> {
  final TransactionsRepo transactionsRepo;

  TransactionFormCubit(this.transactionsRepo)
    : super(TransactionFormState.initial);

  void setDate(DateTime inputDate) => emit(
    state.copyWith(transaction: state.transaction.copyWith(date: inputDate)),
  );

  void setCategoryId(String inputCategoryId) => emit(
    state.copyWith(
      transaction: state.transaction.copyWith(
        category: state.transaction.category?.copyWith(id: inputCategoryId),
      ),
    ),
  );

  void setType(TransactionType inputType) => emit(
    state.copyWith(transaction: state.transaction.copyWith(type: inputType)),
  );

  void setAmount(double inputAmount) => emit(
    state.copyWith(
      transaction: state.transaction.copyWith(amount: inputAmount),
    ),
  );

  void setTitle(String inputTitle) => emit(
    state.copyWith(transaction: state.transaction.copyWith(title: inputTitle)),
  );

  void setDescription(String inputDescription) => emit(
    state.copyWith(
      transaction: state.transaction.copyWith(description: inputDescription),
    ),
  );

  void setNote(String inputNote) => emit(
    state.copyWith(transaction: state.transaction.copyWith(note: inputNote)),
  );

  void addTransactions() async {
    emit(state.copyWith(addStatus: AddTransactionStatus.pending));
    try {
      final newTransaction = await transactionsRepo.addTransaction(
        state.transaction,
      );
      emit(
        state.copyWith(
          addStatus: AddTransactionStatus.success,
          transaction: newTransaction,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          addStatus: AddTransactionStatus.failure,
          errorMsg: e.toString(),
        ),
      );
    }
  }
}

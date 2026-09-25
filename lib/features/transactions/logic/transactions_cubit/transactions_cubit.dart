import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionsRepo transactionsRepo;

  TransactionsCubit(this.transactionsRepo) : super(TransactionsState.initial);

  void fetchLatestTransactions() async {
    emit(state.copyWith(lStatus: TransactionStatus.loading));
    try {
      final latestEnteries = await transactionsRepo.getLatestTransactions();
      emit(
        state.copyWith(
          latest_enteries: latestEnteries,
          lStatus: latestEnteries.isEmpty
              ? TransactionStatus.successWithoutData
              : TransactionStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          lStatus: TransactionStatus.failure,
          lErrorMsg: e.toString(),
        ),
      );
    }
  }

  void fetchDetailedTransactions() async {
    emit(state.copyWith(lStatus: TransactionStatus.loading));
    try {
      final detailedEnteries = await transactionsRepo.getDetailedTransactions();
      emit(
        state.copyWith(
          detailed_enteries: detailedEnteries,
          dStatus: detailedEnteries.isEmpty
              ? TransactionStatus.successWithoutData
              : TransactionStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          dStatus: TransactionStatus.failure,
          dErrorMsg: e.toString(),
        ),
      );
    }
  }

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
      emit(
        state.copyWith(
          addStatus: AddTransactionStatus.failure,
          dErrorMsg: e.toString(),
        ),
      );
    }
  }
}

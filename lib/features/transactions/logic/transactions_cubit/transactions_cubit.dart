import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mahfazty/core/data/enums/transaction_type.dart';
import 'package:mahfazty/core/data/models/day_statistics.dart';
import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/features/transactions/data/repos/transactions_repo.dart';
import 'package:velocity_x/velocity_x.dart';

part 'transactions_state.dart';

class TransactionsCubit extends Cubit<TransactionsState> {
  final TransactionsRepo transactionsRepo;

  TransactionsCubit(this.transactionsRepo) : super(TransactionsState.initial);

  void fetchLatestTransactions() async {
    emit(state.copyWith(lStatus: TransactionStatus.loading));
    try {
      final latestEntries = await transactionsRepo.getLatestTransactions();
      emit(
        state.copyWith(
          latest_enteries: latestEntries,
          lStatus: latestEntries.isEmpty
              ? TransactionStatus.successWithoutData
              : TransactionStatus.success,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          lStatus: TransactionStatus.failure,
          lErrorMsg: e.toString(),
        ),
      );
    }
  }

  void fetchDetailedTransactions(DateTime date) async {
    emit(state.copyWith(dStatus: TransactionStatus.loading));
    try {
      final result = await transactionsRepo.getDetailedTransactions(date);
      debugPrint("Printing Detailed Transactions Result: ");
      debugPrint(result.toString());
      emit(
        state.copyWith(
          detailed_enteries: result['entries'] as List<Transaction>,
          dayStatistics: DayStatistics.fromJson(result['statistics']),
          dStatus: result['entries'].isEmpty
              ? TransactionStatus.successWithoutData
              : TransactionStatus.success,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
      emit(
        state.copyWith(
          dStatus: TransactionStatus.failure,
          dErrorMsg: e.toString(),
        ),
      );
    }
  }
}

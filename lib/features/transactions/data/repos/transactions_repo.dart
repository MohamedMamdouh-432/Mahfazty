import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/core/services/database_service.dart';
import 'package:mahfazty/core/services/di_service.dart';

class TransactionsRepo {
  Future<List<Transaction>> getLatestTransactions() async {
    final List<Transaction> enteries = await getIt<DBService>()
        .fetchAllTransactions();
    return enteries;
  }

  Future<List<Transaction>> getDetailedTransactions() {
    throw UnimplementedError();
  }

  Future<Transaction> addTransaction(Transaction transaction) {
    throw UnimplementedError();
  }
}

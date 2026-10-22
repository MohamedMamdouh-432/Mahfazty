import 'package:mahfazty/core/data/models/transaction.dart';
import 'package:mahfazty/core/services/database_service.dart';
import 'package:mahfazty/core/services/di_service.dart';

class TransactionsRepo {
  Future<List<Transaction>> getLatestTransactions() async {
    return await getIt<DBService>().fetchAllTransactions();
  }

  Future<Map<String, dynamic>> getDetailedTransactions(DateTime date) async {
    return await getIt<DBService>().fetchDetailedTransactions(date);
  }

  Future<Transaction> addTransaction(Transaction transaction) async {
    return await getIt<DBService>().createTransaction(transaction);
  }
}

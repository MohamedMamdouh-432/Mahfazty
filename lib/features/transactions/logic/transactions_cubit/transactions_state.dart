part of 'transactions_cubit.dart';

class TransactionsState extends Equatable {
  final List<Transaction> latestEnteries;
  final List<Transaction> detailedEnteries;
  final Transaction transaction;
  final TransactionStatus lStatus;
  final TransactionStatus dStatus;
  final AddTransactionStatus addStatus;
  final String lErrorMsg;
  final String dErrorMsg;

  const TransactionsState({
    required this.latestEnteries,
    required this.detailedEnteries,
    required this.transaction,
    required this.lStatus,
    required this.dStatus,
    required this.addStatus,
    required this.lErrorMsg,
    required this.dErrorMsg,
  });

  static final initial = TransactionsState(
    latestEnteries: [],
    detailedEnteries: [],
    transaction: Transaction.empty,
    lStatus: TransactionStatus.initial,
    dStatus: TransactionStatus.initial,
    addStatus: AddTransactionStatus.initial,
    lErrorMsg: '',
    dErrorMsg: '',
  );

  TransactionsState copyWith({
    List<Transaction>? latest_enteries,
    List<Transaction>? detailed_enteries,
    Transaction? transaction,
    TransactionStatus? lStatus,
    TransactionStatus? dStatus,
    AddTransactionStatus? addStatus,
    String? lErrorMsg,
    String? dErrorMsg,
  }) {
    return TransactionsState(
      latestEnteries: latest_enteries ?? latestEnteries,
      detailedEnteries: detailed_enteries ?? detailedEnteries,
      transaction: transaction ?? this.transaction,
      lStatus: lStatus ?? this.lStatus,
      dStatus: dStatus ?? this.dStatus,
      addStatus: addStatus ?? this.addStatus,
      lErrorMsg: lErrorMsg ?? this.lErrorMsg,
      dErrorMsg: dErrorMsg ?? this.dErrorMsg,
    );
  }

  @override
  List<Object?> get props => [
    latestEnteries,
    detailedEnteries,
    transaction,
    lStatus,
    dStatus,
    addStatus,
    lErrorMsg,
    dErrorMsg,
  ];
}

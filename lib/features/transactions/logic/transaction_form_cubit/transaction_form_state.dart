part of 'transaction_form_cubit.dart';

class TransactionFormState extends Equatable {
  final Transaction transaction;
  final AddTransactionStatus addStatus;
  final String errorMsg;

  const TransactionFormState({
    required this.transaction,
    required this.addStatus,
    required this.errorMsg,
  });

  static final initial = TransactionFormState(
    transaction: Transaction.empty,
    addStatus: AddTransactionStatus.initial,
    errorMsg: '',
  );

  TransactionFormState copyWith({
    Transaction? transaction,
    AddTransactionStatus? addStatus,
    String? errorMsg,
  }) {
    return TransactionFormState(
      transaction: transaction ?? this.transaction,
      addStatus: addStatus ?? this.addStatus,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }

  @override
  List<Object?> get props => [
    transaction,
    addStatus,
    errorMsg,
  ];
}

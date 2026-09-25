enum TransactionType { 
  income, 
  expense, 
  transfer 
}

enum TransactionStatus { 
  initial,
  loading,
  success,
  successWithoutData,
  failure,
}

enum AddTransactionStatus {
  initial,
  pending,
  success,
  failure,
}
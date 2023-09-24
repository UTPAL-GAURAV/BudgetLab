
enum Gender {
  male,
  female,
  neutral
}

enum TransactionCategory {
  incomeExpense,
  loanLend
}

enum TransactionType {
  income,
  expense,
  investment
}

TransactionType parseTransactionType(String value) {
  switch (value) {
    case 'income':
      return TransactionType.income;
    case 'expense':
      return TransactionType.expense;
    case 'investment':
      return TransactionType.investment;
    default:
      throw ArgumentError('Invalid TransactionType: $value');
  }
}

enum BudgetCycle {
  none,
  Weekly,
  Monthly,
  Yearly
}

BudgetCycle parseBudgetCycle(String value) {
  switch (value) {
    case 'Weekly':
      return BudgetCycle.Weekly;
    case 'Monthly':
      return BudgetCycle.Monthly;
    case 'Yearly':
      return BudgetCycle.Yearly;
    default:
      throw ArgumentError('Invalid BudgetCycle: $value');
  }
}
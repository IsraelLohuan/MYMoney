
import '../models/expense_model.dart';

class HomeState {
  final List<ExpenseModel> expenses;
  final double totalBalance;

  const HomeState({
    required this.expenses,
    required this.totalBalance
  });

  factory HomeState.initial() {
    return const HomeState(
      expenses: [],
      totalBalance: 0
    );
  }

  HomeState copyWith({
    List<ExpenseModel>? expenses,
    double? totalBalance,
  }) {
    return HomeState(
      expenses: expenses ?? this.expenses,
      totalBalance: totalBalance ?? this.totalBalance,
    );
  }
}

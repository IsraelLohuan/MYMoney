
import '../../shared/helpers/state_notifier.dart';
import '../../shared/services/storage/storage.dart';
import 'home_state.dart';
import 'models/expense_model.dart';

class HomeController extends StateNotifier<HomeState> {
  final Storage storage;
  
  HomeController(this.storage) : super(HomeState.initial());
  
  void addExpense(String description, String price) {
    final ExpenseModel expenseModel = ExpenseModel(
      description: description, 
      value: double.parse(price)
    );
    
    emit(value.copyWith(expenses: [...value.expenses, expenseModel]));
  }

  void removeExpense(ExpenseModel model) {
    emit(value.copyWith(expenses: []));
  }
} 
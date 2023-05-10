
import 'dart:convert';

import '../models/expense_model.dart';
import '../shared/helpers/state_notifier.dart';
import '../shared/services/storage/storage.dart';
import '../states/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final Storage storage;
  
  HomeController(this.storage) : super(HomeState.initial()) {
    emit(value.copyWith(expenses: getListFromCache(), totalBalance: total));
  }
  
  String get formatted {
    return valueFinal.toStringAsFixed(2);
  }

  void addExpense(String description, String price) {
    final ExpenseModel expenseModel = ExpenseModel(
      description: description, 
      value: double.parse(price)
    );
    
    emit(value.copyWith(expenses: [...value.expenses, expenseModel]));
    saveInCache();
  }

  void removeExpense(ExpenseModel model) {
    value.expenses.remove(model);
    emit(value.copyWith(expenses: [...value.expenses]));
    saveInCache();
  }

  void saveInCache() {  
    final map  = value.expenses.map((e) => e.toMap()).toList();
    storage.save('expenses', json.encode(map));
  }

  List<ExpenseModel> getListFromCache() {
    final result = storage.get('expenses');

    if(result.isNotEmpty) {
      return json.decode(result).map<ExpenseModel>((data) => ExpenseModel.toModel(data)).toList();
    }

    return [];
  }

  void updateValueTotal(String data) {
    emit(value.copyWith(totalBalance: double.parse(data)));
    storage.save('total', data);
  }

  double get total {
    try {
      return double.parse(storage.get('total'));
    } catch(e) {
      return 0;
    }
  }

  double get valueFinal {
    double total = value.totalBalance;

    for(var data in value.expenses) {
      total -= data.value;
    }

    return total;
  }
} 
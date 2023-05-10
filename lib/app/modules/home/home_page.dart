import 'package:flutter/material.dart';

import '../../shared/ui/widgets/base_state.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/card_tile.dart';
import 'widgets/dialog_new_expense.dart';


class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Money\$',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context, 
            builder: (_) => const DialogNewExpense()
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              SizedBox(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    hintText: 'R\$5000',
                    hintStyle: TextStyle(
                    color: Colors.black,
                      fontSize: 50
                    ),
                    border: InputBorder.none, 
                  ),
                  onChanged: (String? value) {
                    if(value!.isNotEmpty) {
                      print(value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 10,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ValueListenableBuilder(
                    valueListenable: controller,
                    builder: (_, HomeState state, __) { 
                      return Visibility(
                        visible: state.expenses.isNotEmpty,
                        replacement: const Text(
                          'OPS! Nenhuma despesa cadastrada!'
                        ),
                        child: ListView.builder(
                          itemCount: state.expenses.length,
                          itemBuilder: (_, index) {
                            return CardTile(
                              model: state.expenses[index],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
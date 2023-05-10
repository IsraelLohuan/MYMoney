import 'package:flutter/material.dart';
import '../shared/ui/widgets/base_state.dart';
import '../controllers/home_controller.dart';
import '../states/home_state.dart';
import '../widgets/card_tile.dart';

class HomePage extends StatefulWidget {

  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<HomeState>(
        valueListenable: controller,
        builder: (_, state, child) {
          return Scaffold(
          appBar: AppBar(
            title: const Text(
              'My Money\$',
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, '/config-expense', arguments: {'model': null}),
            child: const Icon(Icons.add),
          ),
          bottomSheet: ValueListenableBuilder(
            valueListenable: controller,
            builder: (_, state, child) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Valor restante: ${controller.formatted}'
                  ),
                ],
              );
            },
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  SizedBox(
                    child: TextFormField(
                      initialValue: controller.total.toString(),
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(
                        color: Colors.black,
                          fontSize: 80
                        ),
                        border: InputBorder.none, 
                      ),
                      onChanged: (String? value) {
                        if(value!.isNotEmpty) {
                          controller.updateValueTotal(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Visibility(
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
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        );
        },
    );
  }
}
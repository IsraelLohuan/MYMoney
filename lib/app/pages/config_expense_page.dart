import 'package:flutter/material.dart';
import 'package:mymoney/app/controllers/home_controller.dart';
import 'package:mymoney/app/models/expense_model.dart';

import '../shared/ui/widgets/base_state.dart';

class ConfigExpensePage extends StatefulWidget {

  const ConfigExpensePage({ 
    Key? key,
  }) : super(key: key);

  @override
  State<ConfigExpensePage> createState() => _ConfigExpensePageState();
}

class _ConfigExpensePageState extends BaseState<ConfigExpensePage, HomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController edtDescription = TextEditingController();
  final TextEditingController edtValue = TextEditingController();
  ExpenseModel? model;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Map<String, dynamic>? arguments = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

      if(arguments['model'] != null) {
        model = arguments['model'] as ExpenseModel;
        setState(() {
          
        });
      }

      edtDescription.text = model?.description ?? '';
      edtValue.text = model?.value.toString() ?? '';
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Money\$',
        ),
        actions: [
          Visibility(
            visible: model != null,
            child: IconButton(
              onPressed: () {
                controller.removeExpense(model!);
                Navigator.pop(context);
              }, 
              icon: const Icon(Icons.delete)
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: edtDescription,
                decoration: const InputDecoration(hintText: 'Descrição da despesa'),
                validator: (String? value) {
                  if(value!.isEmpty) {
                    return 'Descrição não pode ser vazia!';
                  }
      
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: edtValue,
                decoration: const InputDecoration(hintText: 'R\$ Valor da despesa'),
                validator: (String? value) {
                  if(value!.isEmpty) {
                    return 'Valor da despesa não pode ser vazio!';
                  }
      
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    controller.addExpense(edtDescription.text, edtValue.text);
                  }, 
                  child: const Text('Confirmar')
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
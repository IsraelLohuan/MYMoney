import 'package:flutter/material.dart';

import '../../../shared/ui/widgets/base_state.dart';
import '../home_controller.dart';

class DialogNewExpense extends StatefulWidget {
  const DialogNewExpense({Key? key}) : super(key: key);

  @override
  State<DialogNewExpense> createState() => _DialogNewExpenseState();
}

class _DialogNewExpenseState extends BaseState<DialogNewExpense, HomeController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController edtDescription;
  late TextEditingController edtValue;

  @override
  void initState() {
    super.initState();
    edtDescription = TextEditingController();
    edtValue = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    edtDescription.dispose();
    edtValue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Nova despesa'),
      content: Form(
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
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar')
        ),
        TextButton(
          onPressed: () {
            if(_formKey.currentState!.validate()) {
              Navigator.of(context).pop();
              controller.addExpense(edtDescription.text, edtValue.text);
            }
          }, 
          child: const Text('Cadastrar')
        )
      ],
    );
  }
}

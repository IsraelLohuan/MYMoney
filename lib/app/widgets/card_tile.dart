import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import '../models/expense_model.dart';
import '../shared/ui/widgets/base_state.dart';

class CardTile extends StatefulWidget {
  final ExpenseModel model;

  const CardTile({
    Key? key,
    required this.model 
  }) : super(key: key);

  @override
  State<CardTile> createState() => _CardTileState();
}

class _CardTileState extends BaseState<CardTile, HomeController> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/config-expense', arguments: {'model': widget.model}),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.green.withOpacity(0.8),
            child: Text(
              widget.model.description[0].toUpperCase(),
              style: const TextStyle(
                color: Colors.white
              ),
            ),
          ),
          title: Text(widget.model.description),
          trailing: Text(widget.model.value.toString())
        ),
      ),
    );
  }
}
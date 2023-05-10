import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<S extends StatefulWidget, C extends Listenable> extends State<S> {
  late C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
  }
}
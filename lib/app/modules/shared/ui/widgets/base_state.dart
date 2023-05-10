import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/state_notifier.dart';

abstract class BaseState<S extends StatefulWidget, C extends StateNotifier> extends State<S> {
  late C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
  }
}
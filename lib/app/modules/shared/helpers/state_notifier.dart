
import 'package:flutter/material.dart';

class StateNotifier<T> extends ValueNotifier<T> {
  StateNotifier(super.value);
  emit(T newState) {
    value = newState;
  }
}

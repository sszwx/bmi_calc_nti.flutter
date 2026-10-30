// lib/features/home/cubit/bmi_cubit.dart
import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf3/features/home/cubit/bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiState()); // initial state

  void selectGender(String gender) => emit(state.copyWith(gender: gender));

  void changeHeight(double height) => emit(state.copyWith(height: height));

  void incrementAge() => emit(state.copyWith(age: state.age + 1));

  void decrementAge() {
    if (state.age > 1) emit(state.copyWith(age: state.age - 1));
  }

  void incrementWeight() => emit(state.copyWith(weight: state.weight + 1));

  void decrementWeight() {
    if (state.weight > 1) emit(state.copyWith(weight: state.weight - 1));
  }

  double calculateBmi() {
    final heightInMeters = state.height / 100;
    return state.weight / pow(heightInMeters, 2);
  }
}

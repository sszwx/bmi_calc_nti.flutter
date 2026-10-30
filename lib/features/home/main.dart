import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf3/features/home/Home_page.dart';
import 'package:sf3/features/home/cubit/bmi_cubit.dart';

void main() {
  runApp(const Bmi());
}

class Bmi extends StatelessWidget {
  const Bmi({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BmiCubit(),
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}
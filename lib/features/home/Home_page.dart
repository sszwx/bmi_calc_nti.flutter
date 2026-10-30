import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sf3/core/colors.dart';
import 'package:sf3/core/responsive.dart';
import 'package:sf3/core/styles.dart';
import 'package:sf3/features/home/cubit/bmi_cubit.dart';
import 'package:sf3/features/home/cubit/bmi_state.dart';
import 'package:sf3/core/widgets/calculate_button.dart';
import 'package:sf3/features/home/widgets/gender_card.dart';
import 'package:sf3/features/home/widgets/weight_age.dart';
import 'package:sf3/features/result/result_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BmiCubit>();

    return Scaffold(
      backgroundColor: ColorsManger.primryColor,
      appBar: AppBar(
        backgroundColor: ColorsManger.primryColor,
        title: Text('BMI Calculator', style: StyelsMaanger.title(context)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<BmiCubit, BmiState>(
          builder: (context, state) {
            final gap = SizedBox(height: context.sp(12));

            final genderRow = Row(
              children: [
                GenederCard(
                  icon: Icons.male,
                  title: 'Male',
                  isSelected: state.gender == 'male',
                  ontap: () => cubit.selectGender('male'),
                ),
                GenederCard(
                  icon: Icons.female,
                  title: 'Female',
                  isSelected: state.gender == 'female',
                  ontap: () => cubit.selectGender('female'),
                ),
              ],
            );

            final heightCard = Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: context.sp(8)),
              decoration: BoxDecoration(
                color: Colors.grey.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text('Height', style: StyelsMaanger.title(context)),
                  Text(
                    '${state.height.toInt()} cm',
                    style: StyelsMaanger.title(context),
                  ),
                  Slider(
                    activeColor: ColorsManger.secColor,
                    min: 100,
                    max: 200,
                    value: state.height,
                    onChanged: cubit.changeHeight,
                  ),
                ],
              ),
            );

            final weightAgeRow = Row(
              children: [
                WeightAndAge(
                  title: 'Weight',
                  value: state.weight,
                  onAdd: cubit.incrementWeight,
                  onRemove: cubit.decrementWeight,
                ),
                WeightAndAge(
                  title: 'Age',
                  value: state.age,
                  onAdd: cubit.incrementAge,
                  onRemove: cubit.decrementAge,
                ),
              ],
            );

            // Landscape: two columns side by side. Portrait: one column.
            final content = context.isLandscape
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [genderRow, gap, heightCard],
                        ),
                      ),
                      Expanded(child: weightAgeRow),
                    ],
                  )
                : Column(
                    children: [genderRow, gap, heightCard, gap, weightAgeRow],
                  );

            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(8),
                  child: content,
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: CalculateButton(
        title: 'Calculate',
        onTap: () {
          final bmi = cubit.calculateBmi();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ResultScreen(bmi: bmi)),
          );
        },
      ),
    );
  }
}
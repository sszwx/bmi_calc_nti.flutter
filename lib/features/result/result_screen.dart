import 'package:flutter/material.dart';
import 'package:sf3/core/colors.dart';
import 'package:sf3/core/responsive.dart';
import 'package:sf3/core/styles.dart';
import 'package:sf3/core/widgets/calculate_button.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  const ResultScreen({super.key, required this.bmi});

  String get category {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal';
    if (bmi < 30) return 'Overweight';
    return 'Obese';
  }

  Color get categoryColor {
    if (bmi < 18.5) return Colors.lightBlue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  String get message {
    if (bmi < 18.5) return 'You Have a Low Body Weight, Try to Eat More.';
    if (bmi < 25) return 'You Have a Normal Body Weight, Good Job.';
    if (bmi < 30) return 'You Have a High Body Weight, Try to Exercise More.';
    return 'You Have an Obese Body Weight, Please Consult a Doctor.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManger.primryColor,
      appBar: AppBar(
        backgroundColor: ColorsManger.primryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('BMI Calculator', style: StyelsMaanger.title(context)),
        centerTitle: true,
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Result', style: StyelsMaanger.title(context)),
                const SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          spacing: context.sp(20),
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                color: categoryColor,
                                fontSize: context.sp(22),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              bmi.toStringAsFixed(1),
                              style: StyelsMaanger.title(context)
                                  .copyWith(fontSize: context.sp(70)),
                            ),
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: context.sp(18),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CalculateButton(
        title: 'Re - Calculate',
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}
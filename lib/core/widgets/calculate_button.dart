import 'package:flutter/material.dart';
import 'package:sf3/core/colors.dart';
import 'package:sf3/core/responsive.dart';
import 'package:sf3/core/styles.dart';

class CalculateButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CalculateButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorsManger.secColor,
      child: InkWell(
        onTap: onTap,
        child: SafeArea(
          top: false,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: context.sp(16)),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: StyelsMaanger.title(context),
            ),
          ),
        ),
      ),
    );
  }
}
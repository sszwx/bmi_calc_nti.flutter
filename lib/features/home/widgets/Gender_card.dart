import 'package:flutter/material.dart';
import 'package:sf3/core/colors.dart';
import 'package:sf3/core/responsive.dart';
import 'package:sf3/core/styles.dart';

class GenederCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final Function() ontap;

  const GenederCard({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: ontap,
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManger.secColor
                : Colors.grey.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(height: context.sp(8)),
              Icon(icon, color: Colors.white, size: context.sp(80)),
              Text(
                title,
                style: StyelsMaanger.title(context).copyWith(color: Colors.grey),
              ),
              SizedBox(height: context.sp(8)),
            ],
          ),
        ),
      ),
    );
  }
}
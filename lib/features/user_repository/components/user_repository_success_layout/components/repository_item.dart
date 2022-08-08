import 'package:flutter/material.dart';
import 'package:github_contact/constants/app_colors.dart';

class RepositoryItem extends StatelessWidget {
  final IconData? icon;
  final String label;
  final String value;
  const RepositoryItem({
    Key? key,
    required this.label,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.darkGray),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Icon(
                icon,
                size: 15,
              ),
            ),
          Text(
            '$value $label',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontFamily: 'Orbitron',
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 2,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18,
    color: AppColors.textSecondary,
  );

  static const TextStyle body = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Orbitron',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}

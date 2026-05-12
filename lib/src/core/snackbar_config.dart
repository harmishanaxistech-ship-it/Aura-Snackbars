import 'package:flutter/material.dart';
import '../enums/snack_type.dart';

class SmartSnackConfig {
  final Duration duration;
  final Alignment position;
  final double borderRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final Widget? leading;

  const SmartSnackConfig({
    this.duration = const Duration(seconds: 3),
    this.position = Alignment.bottomCenter,
    this.borderRadius = 12.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.margin = const EdgeInsets.all(16),
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.leading,
  });

  factory SmartSnackConfig.forType(SnackType type) {
    switch (type) {
      case SnackType.success:
        return const SmartSnackConfig(
          backgroundColor: Colors.green,
          textColor: Colors.white,
          icon: Icons.check_circle_outline,
        );
      case SnackType.error:
        return const SmartSnackConfig(
          backgroundColor: Colors.red,
          textColor: Colors.white,
          icon: Icons.error_outline,
        );
      case SnackType.warning:
        return const SmartSnackConfig(
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          icon: Icons.warning_amber_rounded,
        );
      case SnackType.info:
        return const SmartSnackConfig(
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          icon: Icons.info_outline,
        );
      case SnackType.loading:
        return const SmartSnackConfig(
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          duration: Duration(days: 1), // Persistent until dismissed
        );
    }
  }
}

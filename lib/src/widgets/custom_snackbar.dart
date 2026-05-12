import 'package:flutter/material.dart';
import '../core/snackbar_config.dart';
import '../enums/snack_type.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;
  final SnackType type;
  final SmartSnackConfig config;
  final Widget? action;

  const CustomSnackBar({
    super.key,
    required this.message,
    required this.type,
    required this.config,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveConfig = SmartSnackConfig.forType(type);
    
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: config.margin,
        padding: config.padding,
        decoration: BoxDecoration(
          color: config.backgroundColor ?? effectiveConfig.backgroundColor,
          borderRadius: BorderRadius.circular(config.borderRadius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (type == SnackType.loading)
              const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            else
              Icon(
                config.icon ?? effectiveConfig.icon,
                color: config.textColor ?? effectiveConfig.textColor,
                size: 24,
              ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: config.textColor ?? effectiveConfig.textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (action != null) ...[
              const SizedBox(width: 12),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

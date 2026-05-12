import 'package:flutter/material.dart';
import '../enums/snack_type.dart';
import 'snackbar_service.dart';
import 'snackbar_config.dart';

class SmartSnack {
  static void init(GlobalKey<NavigatorState> navigatorKey) {
    SnackBarService().init(navigatorKey);
  }

  static void success(String message, {SmartSnackConfig? config, Widget? action, Widget? leading}) {
    SnackBarService().show(
      message: message,
      type: SnackType.success,
      config: _combineConfig(config, leading),
      action: action,
    );
  }

  static void error(String message, {SmartSnackConfig? config, Widget? action, Widget? leading}) {
    SnackBarService().show(
      message: message,
      type: SnackType.error,
      config: _combineConfig(config, leading),
      action: action,
    );
  }

  static void warning(String message, {SmartSnackConfig? config, Widget? action, Widget? leading}) {
    SnackBarService().show(
      message: message,
      type: SnackType.warning,
      config: _combineConfig(config, leading),
      action: action,
    );
  }

  static void info(String message, {SmartSnackConfig? config, Widget? action, Widget? leading}) {
    SnackBarService().show(
      message: message,
      type: SnackType.info,
      config: _combineConfig(config, leading),
      action: action,
    );
  }

  static void loading(String message, {SmartSnackConfig? config, Widget? leading}) {
    SnackBarService().show(
      message: message,
      type: SnackType.loading,
      config: _combineConfig(config, leading),
    );
  }

  static void show({
    required String message,
    required SnackType type,
    SmartSnackConfig? config,
    Widget? action,
    Widget? leading,
  }) {
    SnackBarService().show(
      message: message,
      type: type,
      config: _combineConfig(config, leading),
      action: action,
    );
  }

  static SmartSnackConfig? _combineConfig(SmartSnackConfig? config, Widget? leading) {
    if (leading == null) return config;
    if (config == null) return SmartSnackConfig(leading: leading);
    return SmartSnackConfig(
      duration: config.duration,
      position: config.position,
      borderRadius: config.borderRadius,
      padding: config.padding,
      margin: config.margin,
      backgroundColor: config.backgroundColor,
      textColor: config.textColor,
      icon: config.icon,
      leading: leading,
    );
  }

  static void dismiss() {
    SnackBarService().dismiss();
  }
}

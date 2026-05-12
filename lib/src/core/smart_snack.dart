import 'package:flutter/material.dart';
import '../enums/snack_type.dart';
import 'snackbar_service.dart';
import 'snackbar_config.dart';

class SmartSnack {
  static void init(GlobalKey<NavigatorState> navigatorKey) {
    SnackBarService().init(navigatorKey);
  }

  static void success(String message, {SmartSnackConfig? config, Widget? action}) {
    SnackBarService().show(
      message: message,
      type: SnackType.success,
      config: config,
      action: action,
    );
  }

  static void error(String message, {SmartSnackConfig? config, Widget? action}) {
    SnackBarService().show(
      message: message,
      type: SnackType.error,
      config: config,
      action: action,
    );
  }

  static void warning(String message, {SmartSnackConfig? config, Widget? action}) {
    SnackBarService().show(
      message: message,
      type: SnackType.warning,
      config: config,
      action: action,
    );
  }

  static void info(String message, {SmartSnackConfig? config, Widget? action}) {
    SnackBarService().show(
      message: message,
      type: SnackType.info,
      config: config,
      action: action,
    );
  }

  static void loading(String message, {SmartSnackConfig? config}) {
    SnackBarService().show(
      message: message,
      type: SnackType.loading,
      config: config,
    );
  }

  static void show({
    required String message,
    required SnackType type,
    SmartSnackConfig? config,
    Widget? action,
  }) {
    SnackBarService().show(
      message: message,
      type: type,
      config: config,
      action: action,
    );
  }

  static void dismiss() {
    SnackBarService().dismiss();
  }
}

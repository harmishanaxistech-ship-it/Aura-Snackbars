import 'dart:async';
import 'package:flutter/material.dart';
import '../enums/snack_type.dart';
import '../widgets/custom_snackbar.dart';
import '../animations/snackbar_animation.dart';
import 'snackbar_config.dart';

class SnackBarService {
  static final SnackBarService _instance = SnackBarService._internal();
  factory SnackBarService() => _instance;
  SnackBarService._internal();

  GlobalKey<NavigatorState>? _navigatorKey;
  OverlayEntry? _currentEntry;
  Timer? _timer;

  void init(GlobalKey<NavigatorState> key) {
    _navigatorKey = key;
  }

  void show({
    required String message,
    required SnackType type,
    SmartSnackConfig? config,
    Widget? action,
  }) {
    final overlayState = _navigatorKey?.currentState?.overlay;
    if (overlayState == null) return;

    _dismiss();

    final snackConfig = config ?? SmartSnackConfig.forType(type);
    
    _currentEntry = OverlayEntry(
      builder: (context) => Align(
        alignment: snackConfig.position,
        child: SnackBarAnimation(
          position: snackConfig.position,
          child: CustomSnackBar(
            message: message,
            type: type,
            config: snackConfig,
            action: action,
          ),
        ),
      ),
    );

    overlayState.insert(_currentEntry!);

    if (type != SnackType.loading) {
      _timer = Timer(snackConfig.duration, () {
        _dismiss();
      });
    }
  }

  void _dismiss() {
    _timer?.cancel();
    _currentEntry?.remove();
    _currentEntry = null;
  }

  void dismiss() => _dismiss();
}

# Aura Snackbars

A production-ready Flutter package for showing beautiful, reusable, and globally accessible snackbars/toasts without needing `BuildContext`.

## Demo

<div align="center">
  <img src="https://raw.githubusercontent.com/harmishanaxistech-ship-it/Aura-Snackbars/main/screenshots/demo.gif" width="300" alt="Aura Snackbars Demo" />
</div>

## Features

- 🚀 **Global Access**: Show snackbars from anywhere (Services, ViewModels, etc.) without `BuildContext`.
- ✨ **Beautiful UI**: Modern, clean, and highly customizable.
- 🛠 **Predefined Types**: Success, Error, Warning, Info, and Loading.
- ⚙️ **Customizable**: Control duration, position, colors, icons, padding, and more.
- 🎭 **Smooth Animations**: Built-in slide and fade transitions.
- 📦 **Lightweight**: Zero external dependencies.

## Getting Started

### 1. Initialize

Add a `navigatorKey` to your `MaterialApp` and initialize `SmartSnack`:

```dart
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize SmartSnack
    SmartSnack.init(navigatorKey);

    return MaterialApp(
      navigatorKey: navigatorKey, // Required
      home: MyHomePage(),
    );
  }
}
```

### 2. Basic Usage

Show snackbars with a single line of code:

```dart
SmartSnack.success("Login successful");
SmartSnack.error("Something went wrong");
SmartSnack.warning("Check your internet");
SmartSnack.info("New update available");
SmartSnack.loading("Processing...");
```

### 3. Advanced Customization

You can fully customize the appearance and behavior:

```dart
SmartSnack.show(
  message: "Custom Snackbar",
  type: SnackType.success,
  config: SmartSnackConfig(
    duration: Duration(seconds: 5),
    position: Alignment.topCenter,
    backgroundColor: Colors.purple,
    borderRadius: 20,
    padding: EdgeInsets.all(20),
  ),
  action: TextButton(
    onPressed: () => SmartSnack.dismiss(),
    child: Text("DISMISS", style: TextStyle(color: Colors.white)),
  ),
);
```

## Available Types

- `SnackType.success`
- `SnackType.error`
- `SnackType.warning`
- `SnackType.info`
- `SnackType.loading`

## Custom Configuration

The `SmartSnackConfig` class allows you to tweak:
- `duration`: How long the snackbar stays on screen.
- `position`: `Alignment.topCenter`, `Alignment.bottomCenter`, etc.
- `borderRadius`: Corner radius of the snackbar.
- `padding`: Internal padding.
- `margin`: External margin from screen edges.
- `backgroundColor`: Background color.
- `textColor`: Text and icon color.
- `icon`: Leading icon.

## License

This project is licensed under the MIT License.

import 'package:flutter/material.dart';
import 'package:aura_snackbars/aura_snackbars.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    // Initialize SmartSnack with navigatorKey
    SmartSnack.init(navigatorKey);

    return MaterialApp(
      title: 'Aura Snackbar Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aura Snackbar Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton(
                label: 'Show Success',
                color: Colors.green,
                onPressed: () => SmartSnack.success('Login successful!'),
              ),
              _buildButton(
                label: 'Show Error',
                color: Colors.red,
                onPressed: () => SmartSnack.error('Something went wrong'),
              ),
              _buildButton(
                label: 'Show Warning',
                color: Colors.orange,
                onPressed: () => SmartSnack.warning('Check your internet'),
              ),
              _buildButton(
                label: 'Show Info',
                color: Colors.blue,
                onPressed: () => SmartSnack.info('New update available'),
              ),
              _buildButton(
                label: 'Show Loading',
                color: Colors.black,
                onPressed: () {
                  SmartSnack.loading('Processing...');
                  Future.delayed(const Duration(seconds: 3), () {
                    SmartSnack.success('Done!');
                  });
                },
              ),
              _buildButton(
                label: 'Custom Position (Top)',
                color: Colors.purple,
                onPressed: () => SmartSnack.show(
                  message: 'I am at the top!',
                  type: SnackType.info,
                  config: const SmartSnackConfig(
                    position: Alignment.topCenter,
                    backgroundColor: Colors.purple,
                  ),
                ),
              ),
              _buildButton(
                label: 'With Action',
                color: Colors.teal,
                onPressed: () => SmartSnack.success(
                  'Record deleted',
                  action: TextButton(
                    onPressed: () => SmartSnack.dismiss(),
                    child: const Text('UNDO', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
          ),
          onPressed: onPressed,
          child: Text(label),
        ),
      ),
    );
  }
}

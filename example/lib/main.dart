import 'package:flutter/material.dart';
import 'package:simple_stepper_flutter/simple_stepper_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SimpleStepperFlutter(
          children: const [
            "Step 1",
            "Step 2",
            "Step 3",
            "Step 4",
            "Step 5",
          ],
          currentStep: _currentIndex,
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          completeColor: Colors.green,
          completeIcon: Icons.check,
          dividerColor: Colors.grey,
          iconSize: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: 4,
            vertical: 4,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_currentIndex < 4) {
              _currentIndex++;
            } else if (_currentIndex == 4) {
              _currentIndex = 0;
            }
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


# Simple Stepper Flutter Package

## Introduction

This is simple package help you can create a horizontal stepper faster and easier.
## Installation

Add this to you package's pubspec.yaml file:

```bash
  dependencies:
    simple_stepper_flutter: ^1.0.0
```

Run pub get command

```bash
  flutter pub get
```

## Usage/Examples

```dart
SimpleStepperFlutter(
    children: const [
    "Step 1",
    "Step 2",
    "Step 3",
    "Step 4",
    "Step 5",
    ],   //List of title step
    currentStep: 0, // current step
    activeColor: Colors.blue, //color when step is choosing
    inactiveColor: Colors.grey, //color when step is not choosing and incomplete
    completeColor: Colors.green, //color when step is completed
    completeIcon: Icons.check, //Icon when step is completed
    dividerColor: Colors.grey, //Icon of horizontal divider
    iconSize: 20, //Size of icon
    padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
    ), //Padding of stepper
)
```
## Authors

- [@justaboy-dev](https://www.github.com/justaboy-dev)
import 'package:flutter/material.dart';

class IconValue extends StatelessWidget {
  const IconValue({
    Key? key,
    this.value = 0,
    this.iconSize = 20,
  }) : super(key: key);

  /// [iconSize] is the size of the text
  final double iconSize;

  /// [value] is the value of the text
  final int value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 4,
      ),
      child: Text(
        value.toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: iconSize,
        ),
      ),
    );
  }
}

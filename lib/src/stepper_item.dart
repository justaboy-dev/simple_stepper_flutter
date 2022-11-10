
import 'package:flutter/material.dart';

import '../simple_stepper_flutter.dart';

class SimpleStepperFlutterItem extends StatefulWidget {
  const SimpleStepperFlutterItem({
    Key? key,
    required this.content,
    this.activeColor = Colors.blue,
    this.completeColor = Colors.lightGreen,
    this.inactiveColor = Colors.black38,
    this.state = SimpleStepperFlutterItemState.inactive,
    this.completeIcon = Icons.check,
    this.index = 0,
    this.iconSize = 20,
  }) : super(key: key);


  ///[state] is the state of the item (active, inactive, complete)
  final SimpleStepperFlutterItemState state;

  ///[content] is the content of the item
  final String content;

  ///[activeColor] is the color when the item is active
  final Color activeColor;
  
  ///[completeColor] is the color when the item is complete
  final IconData completeIcon;

  ///[inactiveColor] is the color when the item is inactive
  final Color inactiveColor;

  ///[completeColor] is the color when the item is complete
  final Color completeColor;

  ///[index] is the index of the item in the list
  final int index;

  ///[iconSize] is the size of the icon
  final double iconSize;

  @override
  State<SimpleStepperFlutterItem> createState() => _SimpleStepperFlutterItemState();
}

class _SimpleStepperFlutterItemState extends State<SimpleStepperFlutterItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: widget.state == SimpleStepperFlutterItemState.active ? 1.1 : 1,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: widget.state == SimpleStepperFlutterItemState.completed
                  ? widget.completeColor.withOpacity(0.2)
                  : widget.state == SimpleStepperFlutterItemState.active
                      ? widget.activeColor.withOpacity(0.2)
                      : widget.inactiveColor.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: widget.state == SimpleStepperFlutterItemState.completed
                ? Icon(widget.completeIcon,
                    color: widget.completeColor, size: widget.iconSize)
                : IconValue(value: widget.index + 1),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          widget.content,
          style: TextStyle(
            color: widget.state == SimpleStepperFlutterItemState.completed
                ? widget.completeColor
                : widget.state == SimpleStepperFlutterItemState.active
                    ? widget.activeColor
                    : widget.inactiveColor,
          ),
        ),
      ],
    );
  }
}
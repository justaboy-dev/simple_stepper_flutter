
import 'package:flutter/material.dart';

import '../simple_stepper_flutter.dart';

class SimpleStepperFlutter extends StatefulWidget {
  const SimpleStepperFlutter({
    Key? key,
    this.currentStep = 0,
    this.children = const <String>[],
    this.dividerColor = Colors.grey,
    this.activeColor = Colors.blue,
    this.completeColor = Colors.lightGreen,
    this.inactiveColor = Colors.black38,
    this.completeIcon = Icons.check,
    this.iconSize = 20,
    this.padding = const EdgeInsets.all(10),
  }) : 
       assert(currentStep >= 0 && currentStep <= children.length),
       super(key: key);

  ///[padding] is the padding of the widget (default is 10)
  final EdgeInsets padding;

  ///[currentStep] is the current step of the widget (default is 0)
  final int currentStep;

  ///[children] is the list of the steps name (default is empty)
  final List<String> children;


  ///[dividerColor] is the color of the divider between the items
  final Color dividerColor;

  ///[activeColor] is the color when the item is active
  final Color activeColor;

  ///[inactiveColor] is the color when the item is inactive
  final Color inactiveColor;

  ///[completeColor] is the color when the item is complete
  final Color completeColor;

  ///[completeIcon] is the icon when the item is complete (default is [Icons.check])
  final IconData completeIcon;

  ///[iconSize] is the size of the icon
  final double iconSize;

  @override
  State<SimpleStepperFlutter> createState() => _SimpleStepperFlutterState();
}

class _SimpleStepperFlutterState extends State<SimpleStepperFlutter> {
  final _scrollController = ScrollController();

  List<GlobalKey> _keys = <GlobalKey>[];

  @override
  void initState() {
    _keys = List.generate(widget.children.length, (index) => GlobalKey());
    super.initState();
  }

  void scrollToCurrentStep() {
    Scrollable.ensureVisible(
      _keys[widget.currentStep].currentContext!,
      curve: Curves.easeInOut,
      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
      alignment: 0.5,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      scrollToCurrentStep();
    });
    return Padding(
      padding: widget.padding,
      child: ListView.separated(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SimpleStepperFlutterItem(
          key: _keys[index],
          content: widget.children[index],
          state: index == widget.currentStep
              ? SimpleStepperFlutterItemState.active
              : index < widget.currentStep
                  ? SimpleStepperFlutterItemState.completed
                  : SimpleStepperFlutterItemState.inactive,
          index: index,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
          completeColor: widget.completeColor,
          completeIcon: widget.completeIcon,
          iconSize: widget.iconSize,
        ),
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 2,
                  width: 40,
                  decoration: BoxDecoration(
                    color: widget.dividerColor,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: widget.children.length,
      ),
    );
  }
}
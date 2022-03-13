import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InheritedWrapper extends StatefulWidget {
  final Widget child;
  InheritedWrapper({Key? key, required this.child}) : super(key: key);

  static InheritedWrapperState of(BuildContext context, {bool build = true}) {
    return build
        ? context.dependOnInheritedWidgetOfExactType<InheritedCounter>()!.data
        : context.findAncestorWidgetOfExactType<InheritedCounter>()!.data;
  }

  @override
  InheritedWrapperState createState() => InheritedWrapperState();
}

class InheritedWrapperState extends State<InheritedWrapper> {
  int counter = 1;
  final myController = TextEditingController();
  final blueStyle = Colors.blue;
  var textStyle = Colors.red;

  void incrementCounter() {
    setState(() {
      counter++;
      print(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InheritedCounter(
        child: this.widget.child, data: this, counter: counter);
  }
}

FocusNode _textNode = new FocusNode();

class WidgetTextField extends StatelessWidget {
  const WidgetTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("Text Field Updated");
    return Expanded(
        child:
            // KeyboardListener(
            //     focusNode: _textNode,
            //     onKeyEvent: printMe(),
            //     child:
            Scaffold(
                // appBar: AppBar(title: const Text('Empty List Test')),
                body:
                    //   SizedBox(
                    // height: 2000,
                    // width: 2000,
                    // child:
                    RawKeyboardListener(
      autofocus: true,
      focusNode: _textNode,
      onKey: (eventData) {
        if (eventData.isKeyPressed(LogicalKeyboardKey.controlLeft)) {
          if (eventData.isKeyPressed(LogicalKeyboardKey.slash)) {
            state.incrementCounter();
            state.textStyle = Colors.blue;
            state.myController.text = state.myController.text;
            print(state.myController.text);
          }
        }
        if (eventData.isKeyPressed(LogicalKeyboardKey.enter)) {
          state.incrementCounter();
          // printMe('hoi');
        }
      },
      child: TextField(
        controller: state.myController,
        style: TextStyle(color: state.textStyle),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: '${state.counter}',
        ),
        minLines: state.counter + 1,
        maxLines: state.counter + 1,
      ),
    )));
  }

  printMe(hoi) {
    print(hoi);
  }
}

class WidgetA extends StatefulWidget {
  const WidgetA({Key? key}) : super(key: key);

  @override
  _WidgetAState createState() => _WidgetAState();
}

class _WidgetAState extends State<WidgetA> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text("Increment"));
  }

  onPressed() {
    InheritedWrapperState wrapper = InheritedWrapper.of(context);
    print('onpressed');
    wrapper.incrementCounter();
  }
}

class WidgetB extends StatelessWidget {
  const WidgetB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget B");
    return new Text('${state.counter}');
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final InheritedWrapperState state = InheritedWrapper.of(context);
    print("widget C");
    return new Text('I am Widget C');
  }
}

class InheritedCounter extends InheritedWidget {
  InheritedCounter(
      {Key? key,
      required this.child,
      required this.data,
      required this.counter})
      : super(key: key, child: child);

  final Widget child;
  final int counter;
  final InheritedWrapperState data;

  @override
  bool updateShouldNotify(InheritedCounter oldWidget) {
    return counter != oldWidget.counter;
  }
}

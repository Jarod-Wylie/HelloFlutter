import 'package:flutter/material.dart';
import 'inherited_counter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: TextEditField(),
    );
  }
}

// The visble line number for the line of text.
class LineNumber extends StatefulWidget {
  const LineNumber({Key? key}) : super(key: key);

  @override
  State<LineNumber> createState() => _LineNumber();
}

class _LineNumber extends State<LineNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hoi'),
      ),
    );
  }
}

// The Field in which the user edits their content.
class TextEditField extends StatefulWidget {
  const TextEditField({Key? key}) : super(key: key);

  @override
  State<TextEditField> createState() => _TextEditField();
}

class _TextEditField extends State<TextEditField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  int sum = 1;
  handleKey(RawKeyEvent key) {
    String _keyCode;
    _keyCode = key.logicalKey.toString(); //keycode of key event (66 is return)

    sum++;
    print("why does this run twice $_keyCode");
    print('Pressed:' + sum.toString());
  }

  FocusNode _textNode = new FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int itemCount = 9;
  int incrementer = 1;
  extendList(itemCount) {
    itemCount++;
  }

  @override
  Widget build(BuildContext context) {
    return InheritedWrapper(
      // color: Colors.blueGrey,
      // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),

      child: Row(mainAxisSize: MainAxisSize.min, children: [
        //Text('a'),
        WidgetTextField(),
        WidgetA(),
      ]),
    );
  }
}

import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      SizedBox(
        height: 10,
        width: 10,
        child: TextField(
          cursorHeight: 10,
          cursorWidth: 10,
          maxLength: 10,
          controller: _controller,
        ),
      ),
      Text('Hoi'),
      Text('Hoi'),
    ] //Children
            ));
  }
}

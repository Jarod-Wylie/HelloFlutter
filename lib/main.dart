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

  int itemCount = 9;
  int incrementer = 1;
  extendList(itemCount) {
    itemCount++;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Empty List Test')),
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: index.toString(),
                    ),
                    textInputAction: extendList(itemCount),
                    minLines: 2,
                    maxLines: 2,
                  ),
                );
              },
            )
          : const Center(child: Text('No items')),
    );
  }
}

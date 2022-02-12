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

  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 350,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: 4,
        crossAxisSpacing: 50,
        children: _buildGridTileList(1));
  }

// The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
// The List.generate() constructor allows an easy way to create
// a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (i) => Container(
              child: Scaffold(
            body: TextField(
              controller: _controller,
              onSubmitted: (String value) async {
                await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Thanks!'),
                      content: Text(
                          'You typed "$value", which has length ${value.characters.length}.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          )));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox.expand(
//         child: TextField(
//           controller: _controller,
//           onSubmitted: (String value) async {
//             await showDialog<void>(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   title: const Text('Thanks!'),
//                   content: Text(
//                       'You typed "$value", which has length ${value.characters.length}.'),
//                   actions: <Widget>[
//                     TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text('OK'),
//                     ),
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
}
    

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
//       Text('Hoi'),
//       Text('Hoi'),
//     ] //Children
//             ));
//   }
// }

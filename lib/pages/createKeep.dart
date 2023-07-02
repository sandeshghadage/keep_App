import 'package:flutter/material.dart';
import 'package:keep_clone_app/constants/colors.dart';
import 'package:keep_clone_app/model/keepModel.dart';

class CreateKeep extends StatefulWidget {
  const CreateKeep({super.key});

  @override
  State<CreateKeep> createState() => _CreateKeepState();
}

class _CreateKeepState extends State<CreateKeep> {
  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  final list = keepModel.keepList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: primaryColor, actions: [
        Icon(Icons.pin_drop_outlined),
        Icon(Icons.notification_add),
        Icon(Icons.archive_outlined)
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(children: [
          TextField(
            controller: _titleController,
            style: TextStyle(
              color: textColor,
              fontSize: 22,
            ),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
              hintText: 'Title',
              hintStyle: const TextStyle(fontSize: 22, color: textColor),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _textController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
                hintText: 'Note',
                hintStyle: const TextStyle(fontSize: 18, color: textColor),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _addKeepItem(_titleController.text, _textController.text);
            },
            child: Text('Save Keep'),
          )
        ]),
      ),
    );
  }

  void _addKeepItem(String title, String text) {
    setState(() {
      list.add(keepModel(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          title: title,
          text: text));
    });
    _textController.clear();
    _titleController.clear();
    // list.forEach((item) {
    //   print(item.text);
    // });
  }

  void _updateKeepItem(String text) {
    setState(() {});
  }
}

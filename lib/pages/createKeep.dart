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
      appBar:
          AppBar(elevation: 0, backgroundColor: primaryColor, actions: const [
        Icon(Icons.pin_drop_outlined),
        Icon(Icons.notification_add),
        Icon(Icons.archive_outlined)
      ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: const TextStyle(
                color: textColor,
                fontSize: 22,
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: 22, color: textColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
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
                style: const TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
                  hintText: 'Note',
                  hintStyle: TextStyle(fontSize: 18, color: textColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff525355),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              child: const Text('Create Keep'),
            )
          ],
        ),
      ),
    );
  }

  void _addKeepItem(String title, String text) {
    setState(
      () {
        list.add(
          keepModel(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: title,
              text: text),
        );
      },
    );
    _textController.clear();
    _titleController.clear();
    list.forEach(
      (item) {
        print(item.text);
      },
    );
  }

  void _updateKeepItem(String text) {
    setState(() {});
  }
}

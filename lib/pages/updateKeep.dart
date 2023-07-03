import 'package:flutter/material.dart';
import 'package:keep_clone_app/constants/colors.dart';
import 'package:keep_clone_app/model/keepModel.dart';

class UpdateKeep extends StatefulWidget {
  final String id;
  final String title;
  final String text;
  const UpdateKeep(
      {required this.id, required this.title, required this.text, super.key});

  @override
  State<UpdateKeep> createState() => _UpdateKeepState(title: title);
}

class _UpdateKeepState extends State<UpdateKeep> {
  final String title;
  _UpdateKeepState({required this.title});
  @override
  void initState() {
    super.initState();
    print(title);
  }

  final TextEditingController _titleController =
      TextEditingController(text: "title");
  final TextEditingController _textController =
      TextEditingController(text: 'Default Text');
  final list = keepModel.keepList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        actions: const [
          Icon(Icons.pin_drop_outlined),
          Icon(Icons.notification_add),
          Icon(Icons.archive_outlined)
        ],
      ),
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
                _updateKeepItem(
                    widget.id, _titleController.text, _textController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff525355),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              child: const Text('Save Keep'),
            )
          ],
        ),
      ),
    );
  }

  void _updateKeepItem(String id, String title, String text) {
    setState(
      () {
        int targetIndex = list.indexWhere((fruit) => fruit.id == id);
        if (targetIndex != -1) {
          list[targetIndex] = keepModel(id: id, title: title, text: text);
        }
      },
    );
    list.forEach((item) {
      print(item.text);
    });
  }
}

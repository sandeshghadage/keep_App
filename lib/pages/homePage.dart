import 'package:flutter/material.dart';
import 'package:keep_clone_app/pages/createKeep.dart';
import 'package:keep_clone_app/pages/keepItem.dart';
import '../constants/colors.dart';
import '../model/keepModel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final list = keepModel.keepList();

  final List<String> dataArray = [
    'Item 1',
    'Item 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        title: SearchBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            for (keepModel keep in list)
              KeepItem(
                keepText: keep.text.toString(),
                id: keep.id.toString(),
                onDeleteItem: _deleteKeepItem,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateKeep()),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deleteKeepItem(String id) {
    setState(() {
      list.removeWhere((item) => item.id == id);
    });
  }

  // void _addKeepItem(String text) {
  //   setState(() {
  //     list.add(keepModel(
  //         id: DateTime.now().millisecondsSinceEpoch.toString(), text: text));
  //   });
  // }
}

Widget SearchBox() {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
          prefixIcon: const Icon(
            Icons.menu,
            color: textColor,
          ),
          hintText: 'Search your notes',
          hintStyle: const TextStyle(fontSize: 16, color: textColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(22),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          fillColor: Color(0xff525355),
          suffix: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: const Text(
                  "dfdfs",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                child: Text("df"),
              )
            ],
          )),
    ),
  );
}

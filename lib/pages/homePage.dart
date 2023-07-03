import 'package:flutter/material.dart';
import 'package:keep_clone_app/pages/createKeep.dart';
import 'package:keep_clone_app/pages/keepItem.dart';
import 'package:keep_clone_app/widgets/burgerMenu.dart';
import 'package:keep_clone_app/widgets/searchBox.dart';
import '../constants/colors.dart';
import '../model/keepModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  final list = keepModel.keepList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const BurgerMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: primaryColor,
        title: SearchBox(onOpenDrawer: _openDrawer),
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
                id: keep.id.toString(),
                keepTitle: keep.title.toString(),
                keepText: keep.text.toString(),
                onDeleteItem: _deleteKeepItem,
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff525355),
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
}

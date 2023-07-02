import 'package:flutter/material.dart';
import 'package:keep_clone_app/pages/createKeep.dart';
import 'package:keep_clone_app/pages/keepItem.dart';
import 'package:keep_clone_app/widgets/burgerMenu.dart';
import 'package:keep_clone_app/widgets/searchBox.dart';
import '../constants/colors.dart';
import '../model/keepModel.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void openDrawer() {
    Scaffold.of(context).openDrawer();
  }

  final list = keepModel.keepList();

  final List<String> dataArray = [
    'Item 1',
    'Item 2',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: BurgerMenu(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primaryColor,
        // title: Builder(
        //   builder: (context) => SearchBox(
        //     onOpenDrawer: () => openDrawer(),
        //   ),
        // ),
        title: SearchBox(onOpenDrawer: openDrawer),
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

// Widget SearchBox() {
//   return Container(
//     child: TextField(
//       decoration: InputDecoration(
//           contentPadding:
//               const EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
//           prefixIcon: GestureDetector(
//             onTap: (){},
//             child: const Icon(
//               Icons.menu,
//               color: textColor,
//             ),
//           ),
//           hintText: 'Search your notes',
//           hintStyle: const TextStyle(fontSize: 16, color: textColor),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(22),
//             borderSide: const BorderSide(
//               width: 0,
//               style: BorderStyle.none,
//             ),
//           ),
//           filled: true,
//           fillColor: Color(0xff525355),
//           suffix: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 child: const Text(
//                   "dfdfs",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//               Container(
//                 child: Text("df"),
//               )
//             ],
//           )),
//     ),
//   );
// }

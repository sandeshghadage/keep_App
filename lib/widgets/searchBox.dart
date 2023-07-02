import 'package:flutter/material.dart';
import 'package:keep_clone_app/constants/colors.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onOpenDrawer;
  const SearchBox({required this.onOpenDrawer, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 26.0),
            prefixIcon: GestureDetector(
              onTap: onOpenDrawer,
              child: const Icon(
                Icons.menu,
                color: textColor,
              ),
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
    ;
  }
}

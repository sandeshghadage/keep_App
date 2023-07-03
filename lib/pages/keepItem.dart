import 'dart:html';
import 'package:flutter/material.dart';
import 'package:keep_clone_app/pages/updateKeep.dart';

import '../constants/colors.dart';

class KeepItem extends StatelessWidget {
  final String id;
  final String keepTitle;
  final String keepText;
  final onDeleteItem;

  KeepItem(
      {super.key,
      required this.id,
      required this.keepTitle,
      required this.keepText,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                UpdateKeep(id: id, title: keepTitle, text: keepText),
          ),
        )
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keepTitle,
              style: const TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                keepText,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(Icons.delete_forever_outlined,
                    color: Color(0xff525355)),
                const SizedBox(width: 10),
                const Icon(Icons.edit, color: Color(0xff525355)),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    onDeleteItem(id);
                  },
                  child: const Icon(
                    Icons.delete_forever_outlined,
                    color: Color(0xff525355),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:keep_clone_app/pages/createKeep.dart';

import '../constants/colors.dart';

class KeepItem extends StatelessWidget {
  final String id;
  final String keepText;
  final onDeleteItem;

  const KeepItem(
      {super.key,
      required this.id,
      required this.keepText,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateKeep()),
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
        padding: EdgeInsets.all(10),
        // color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              keepText,
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                'This is dummy note text, It will change later.',
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete_forever_outlined, color: Color(0xff525355)),
                const SizedBox(width: 10),
                Icon(Icons.edit, color: Color(0xff525355)),
                const SizedBox(width: 10),
                GestureDetector(
                    onTap: () {
                      onDeleteItem(id);
                    },
                    child: Icon(Icons.delete_forever_outlined,
                        color: Color(0xff525355))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

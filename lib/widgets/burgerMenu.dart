import 'package:flutter/material.dart';
import 'package:keep_clone_app/constants/colors.dart';
import 'package:keep_clone_app/pages/createKeep.dart';

class BurgerMenu extends StatelessWidget {
  const BurgerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: primaryColor,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        children: [
          Text(
            "Google Keep",
            style: TextStyle(
                fontSize: 24, color: textColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: Icon(
              Icons.chat_bubble,
              color: textColor,
            ),
            title: Text(
              "Notes",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: textColor,
            ),
            title: Text(
              "Reminder",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: textColor,
            ),
            title: Text(
              "Create new lable",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.archive,
              color: textColor,
            ),
            title: Text(
              "Archive",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w400),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CreateKeep()),
              );
            },
            leading: Icon(
              Icons.add_box_outlined,
              color: textColor,
            ),
            title: Text(
              "Add new keep",
              style: TextStyle(
                  fontSize: 20, color: textColor, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    ));
  }
}

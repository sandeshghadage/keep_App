import 'package:flutter/material.dart';
import 'package:keep_clone_app/constants/colors.dart';

class SearchBox extends StatelessWidget {
  final VoidCallback onOpenDrawer;
  const SearchBox({required this.onOpenDrawer, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        fillColor: const Color(0xff525355),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(
                Icons.list_alt,
                color: textColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Container(
                width: 120.0,
                height: 120.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTYmkp9a2rrD1Sskb9HLt5mDaTt4QaIs8CcBg&usqp=CAU",
                    ),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

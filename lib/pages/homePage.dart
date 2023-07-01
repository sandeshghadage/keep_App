import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 10,
        backgroundColor: Color(0xff202124),
        title: TextField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              prefixIcon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              hintText: 'Search your notes',
              hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              // contentPadding: EdgeInsets.all(16),
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../custom_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Checkbox
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar Section
      appBar: AppBar(
        title: Text(
          "All ToDos",
          style: boldStyle(30, Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  //color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.cyan,
          leading: Checkbox(
            value: isCheck,
            onChanged: (value) {
              setState(() {
                isCheck = value!;
              });
            },
          ),
          title: Text(
            "Title",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decorationThickness: 2,
              decorationColor: Colors.orange,
              decorationStyle: TextDecorationStyle.solid,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          subtitle: Text(
            "Sub Title",
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              //Edit IconButton
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit,
                  color: Colors.black,
                ),
              ),
              //Delete IconButton
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

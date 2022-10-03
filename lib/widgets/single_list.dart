import 'package:flutter/material.dart';

class MySingleList extends StatefulWidget {
  const MySingleList({Key? key}) : super(key: key);

  @override
  State<MySingleList> createState() => _MySingleListState();
}


class _MySingleListState extends State<MySingleList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Primary text'),
          leading: Icon(Icons.label),
          trailing: Text('Metadata'),
        ),
      ],
    );
  }
}


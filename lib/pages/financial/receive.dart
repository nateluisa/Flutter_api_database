import 'package:flutter/material.dart';

import '../../menu/menu.dart';

class ReceiveScreen extends StatelessWidget {
  ReceiveScreen({Key? key, required this.receiveContext}) : super(key: key);
  final BuildContext receiveContext;
  bool opacidade = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            //Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => Menu(),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back_outlined, // add custom icons also
          ),
        ),
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
        title: Padding(
          padding: const EdgeInsets.only(left: 55),
          child: Text(
            'Contas a receber',
          ),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: Duration(milliseconds: 800),
        child: ListView(
          //children: BankInherited.of(context).bankList,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 80, 62, 115),
      ),
    );
  }
}

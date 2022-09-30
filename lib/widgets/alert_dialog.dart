import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
    required this.content,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Function onConfirm;
  final Function onCancel;
  final Widget content;
  final Widget title;
  final Widget icon;

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: AlertDialog(
        icon: widget.icon,
        content: widget.content,
        title: widget.title,
        actions: <Widget>[
          TextButton(
              onPressed: () {
                widget.onCancel();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(fontSize: 16),
              )),
          TextButton(
              onPressed: () {
                widget
                    .onConfirm(); // acessa o final criado para que possa ser chamado em outra tela a funçao que ser validada para o botao
              },
              child: Text(
                'Confirmar',
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}

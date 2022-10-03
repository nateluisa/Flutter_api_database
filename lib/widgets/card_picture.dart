import 'package:flutter/material.dart';

class MyCardPicture extends StatefulWidget {
  const MyCardPicture({Key? key}) : super(key: key);

  @override
  State<MyCardPicture> createState() => _MyCardPictureState();
}

class _MyCardPictureState extends State<MyCardPicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 180,
      child: SizedBox(
        height: 180,
        child: Card(
          elevation: 6,
          shadowColor: Colors.grey,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(
                    Icons.shopping_basket_rounded,
                    size: 35,
                    color: Colors.deepPurple,
                  ),
                  title: Text(
                    'Compras',
                    style: TextStyle(fontSize: 23),
                  ),
                  subtitle:
                  Text('Deseja buscar pela ultima compra realizada?'),
                  isThreeLine: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextButton(
                      child: const Text('ESCONDER'),
                      onPressed: () {
                        /* ... */
                      },
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      child: const Text('IR PARA'),
                      onPressed: () {

                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

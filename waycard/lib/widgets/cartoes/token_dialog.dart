import 'package:flutter/material.dart';

class TokenDialog extends StatelessWidget {
  final String token;

  const TokenDialog(this.token);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.vpn_key, color: Colors.yellow,),
            title: Text(
              "Seu token",
              textAlign: TextAlign.start,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              token,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void close(BuildContext context) => Navigator.pop(context);
}

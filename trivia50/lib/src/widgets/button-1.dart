import 'package:flutter/material.dart';

class Button1 extends StatelessWidget {
  final String text;
  final Color color1;
  final Color color2;
  final Color color3;
  final Function onPress;

  const Button1({
    Key key,
    @required this.text,
    this.color1,
    this.color2,
    this.color3,
    @required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFf9b92f),
                    Color(0xFFf4d41f),
                    Color(0xFFf9e248),
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.all(10.0),
              primary: Colors.deepPurple,
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            onPressed: onPress,
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

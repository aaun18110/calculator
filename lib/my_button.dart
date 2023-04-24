import 'package:flutter/material.dart';

var gcolor = Colors.red;

var text = const TextStyle(
    color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);

class MyButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  // title pass as the parameter or title not pass the required Key word simple
  // pass the empty string
  const MyButton(
      {super.key,
      this.title = '',
      this.color = Colors.grey,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Center(
                child: Text(
              title,
              style: text,
            )),
          ),
        ),
      ),
    );
  }
}

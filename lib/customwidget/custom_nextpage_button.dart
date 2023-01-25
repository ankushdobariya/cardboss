import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({Key? key, required this.text, required this.onPress}) : super(key: key);

  final String text;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width,
      decoration: BoxDecoration(
          color: Color(0xff07BCD6),
          borderRadius: BorderRadius.circular(7)
      ),
      alignment: Alignment.center,
      child: TextButton(onPressed: onPress, child: Text(text,style: TextStyle(color: Colors.white,fontSize: 17),),)
    );
  }
}

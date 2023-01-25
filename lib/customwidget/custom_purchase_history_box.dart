import 'package:flutter/material.dart';

class CustomePurchaseHistoryBox extends StatelessWidget {
  const CustomePurchaseHistoryBox({Key? key, required this.text, required this.bill, required this.date,}) : super(key: key);

  final String text;
  final String bill;
  final String date;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.14,
        width: size.width,
        decoration: BoxDecoration(
            color: Color(0xff30333A),
            borderRadius: BorderRadius.circular(8)
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(date,style: TextStyle(color: Colors.white,fontSize: 18),),
                Spacer(),
                Text(bill,style: TextStyle(color: Colors.white,fontSize: 18),)
              ],),
              Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),

            ],
          ),
        )
    );
  }
}

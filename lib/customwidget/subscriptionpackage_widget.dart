import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
        required this.height,
        required this.width,
        required this.title,
        required this.subTitle,
        required this.offer,
        required this.ontap,
        required this.color1,
        required this.color2,
        required this.price})
      : super(key: key);
  final double height;
  final String price;
  final double width;
  final Color color1;
  final Color color2;
  final String title;
  final String subTitle;
  final String offer;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: Theme.of(context).backgroundColor,
      child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [color1, color2])),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(
                  flex: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Spacer(
                  flex: 1,
                ),
                Text(
                  offer,
                  style: TextStyle(color: Color(0xffDFDFDF), fontSize: 18),
                ),
                Spacer(
                  flex: 4,
                ),
                Center(
                  child: Container(
                      height: size.height * 0.060,
                      width: size.width * 0.35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7)),
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: ontap,
                        child: Text(
                          "Subscribe",
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      )),
                ),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          )),
    );
  }
}
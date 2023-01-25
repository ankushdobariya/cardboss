import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';

class CardBreakdown extends StatefulWidget {
  const CardBreakdown({Key? key}) : super(key: key);

  @override
  State<CardBreakdown> createState() => _CardBreakdownState();
}

class _CardBreakdownState extends State<CardBreakdown> {

  static List<String> imageList = ["image/Mask group 1.png","image/Screenshot.png","image/Screenshot 2.png"];
  static List<String> textList  = ["Edge grid: 7","Corner grid: 9","Surface grid: 10"];

    @override
    Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor:Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor:Theme.of(context).backgroundColor,
          title: Text("Card Breakdown"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.34,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xff26292F),
                borderRadius: BorderRadius.circular(8)
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageList.length,
                itemBuilder: (context,index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 15,left: 10),
                  child: Column(
                    children: [
                    Container(
                      margin: EdgeInsets.only(left: 5,right: 5),
                      height: size.height * 0.25,
                      width:  size.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage("${imageList[index]}"),fit: BoxFit.fill
                        ),
                      ),
                    ),
                      Spacer(),
                      Text("${textList[index]}",style: TextStyle(color: Colors.white,fontSize: 17),),
                      Spacer()
                  ],),
                );
              },),
            ),
            Spacer(flex: 2,),
            Text("Slabbed Card",style: TextStyle(color: Colors.white,fontSize: 20),),
            Spacer(),
            Container(
              height: size.height * 0.30,
              width: size.width,
              decoration: BoxDecoration(
                  color: Color(0xff26292F),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: size.height * 0.27,
                    width: size.width * 0.41,
                    decoration: BoxDecoration(
                        color: Color(0xff30333A),
                        image: DecorationImage(
                          image: AssetImage("image/Card 1.png"),fit: BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  Container(
                    height: size.height * 0.27,
                    width: size.width * 0.41,
                    decoration: BoxDecoration(
                        color: Color(0xff30333A),
                        image: DecorationImage(
                          image: AssetImage("image/Card 2.png"),fit:BoxFit.fill
                        ),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 2,),
            NextPageButton(text: "Download Grading Report", onPress: () {

            },),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

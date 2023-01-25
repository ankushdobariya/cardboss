import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';

class CheckPage extends StatefulWidget {
  const CheckPage({Key? key}) : super(key: key);

  @override
  State<CheckPage> createState() => _CheckPageState();
}

class _CheckPageState extends State<CheckPage> {

  bool good = true;
  bool bad = false;
  bool block = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Check",style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 10),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.020,),
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Front Side",style:TextStyle(color: Color(0xffCBCBCB),fontSize: 17),),
                    SizedBox(height: size.height * 0.010,),
                    Container(
                      height: size.height * 0.30,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("image/Card 1.png"),fit: BoxFit.fill
                          ),
                          color: Color(0xff30333A),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10,right: 10),
                              child: Container(
                                height: size.height * 0.045,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          showDialog(context: context, builder: (context) {
                                            return Dialog(child: Image.asset("image/Card 1.png"));
                                          },);
                                        });
                                      },
                                      child: Image.asset("image/arrow.png")),
                                ),
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Back Side",style:TextStyle(color: Color(0xffCBCBCB),fontSize: 17)),
                    SizedBox(height: size.height * 0.010,),
                    Container(
                      height: size.height * 0.30,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("image/Card 2.png"),fit:BoxFit.fill
                        ),
                          color: Color(0xff30333A),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 10,right: 10),
                                child: Container(
                                  height: size.height * 0.045,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            showDialog(context: context, builder: (context) {
                                              return Dialog(child: Image.asset("image/Card 2.png"));
                                            },);
                                          });
                                        },
                                        child: Image.asset("image/arrow.png")),
                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    )

                  ],
                ),
              ],
            ),
            Spacer(flex: 2,),
            InkWell(
              onTap: () {
                setState(() {
                  good = true;
                  block = false;
                  bad = false;
                });
              },
              child: Container(
                height: size.height * 0.060,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color:good == true ? Color(0xff07BCD6):Color(0xff414141),width: 2)
                ),
                alignment: Alignment.center,
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.04,),
                      good == true ? Icon(Icons.radio_button_checked,color: Color(0xff07BCD6),):Icon(Icons.radio_button_off_rounded,color: Color(0xff07BCD6),),
                      SizedBox(width: size.width * 0.08,),
                      Text("Good",style: TextStyle(color: Colors.white),),
                    ],
                  )
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  good = false;
                  block = false;
                  bad = true;
                });
              },
              child: Container(
                height: size.height * 0.060,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 2,color:bad== true ?Color(0xff07BCD6): Color(0xff414141))
                ),
                alignment: Alignment.centerLeft,
                child: Row(
              children: [
              SizedBox(width: size.width * 0.04,),
              bad == true ? Icon(Icons.radio_button_checked,color: Color(0xff07BCD6),):Icon(Icons.radio_button_off_rounded,color: Color(0xff07BCD6),),
              SizedBox(width: size.width * 0.08,),
              Text("Bad",style: TextStyle(color: Colors.white),),
              ],
            )
              ),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                setState(() {
                  good = false;
                  block = true;
                  bad = false;
                });
              },
              child: Container(
                height: size.height * 0.060,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(width: 2,color:block == true ?Color(0xff07BCD6):Color(0xff414141))
                ),
                alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      SizedBox(width: size.width * 0.04,),
                      block == true ? Icon(Icons.radio_button_checked,color: Color(0xff07BCD6),):Icon(Icons.radio_button_off_rounded,color: Color(0xff07BCD6),),
                      SizedBox(width: size.width * 0.08,),
                      Text("Block",style: TextStyle(color: Colors.white),),

                    ],
                  )
              ),
            ),
            Spacer(flex: 5,),
            NextPageButton(text: "Verify", onPress: () {

            },),
            SizedBox(height: size.height * 0.030,)
          ],
        ),
      ),
    );
  }
}

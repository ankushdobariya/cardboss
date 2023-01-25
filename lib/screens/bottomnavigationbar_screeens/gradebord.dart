// ignore_for_file: null_argument_to_non_null_type

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:subscription/screens/cardbrakdown.dart';
import 'package:subscription/screens/homepage.dart';

class GradeBoard extends StatefulWidget {
  const GradeBoard({Key? key}) : super(key: key);

  @override
  State<GradeBoard> createState() => _GradeBoardState();
}

class _GradeBoardState extends State<GradeBoard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: goBack,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          title: Text("Gradeboard",style: TextStyle(color: Color(0xffEFF0F2)),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(0xff26292F),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return CardBreakdown();
                              },));
                            },
                            child: Image.asset("image/Card 2.png")),
                        Spacer(),
                        Row(mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Flexible(child: Text("Grading Report",style: TextStyle(color: Color(0xff07BCD6),fontSize: 14),)),
                            SizedBox(width: size.width * 0.040,),
                            InkWell(
                                onTap: () {
                                    Share.share('check out my website https://example.com',);
                                    },
                                child: Image.asset("image/Ic_Share.png",scale:2.7,)),
                            SizedBox(width: size.width * 0.020,),
                            Image.asset("image/Ic_Delete.png",scale:2.7),
                          ],
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                );
              },),
        )
      ),
    );
  }

  Future<bool> goBack()
  {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    },));
    return Future.value();
  }
}

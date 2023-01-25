import 'package:flutter/material.dart';
import 'package:subscription/screens/checkpage.dart';

class AprovePage extends StatefulWidget {
  const AprovePage({Key? key}) : super(key: key);

  @override
  State<AprovePage> createState() => _AprovePageState();
}

class _AprovePageState extends State<AprovePage> {

  void _showModalBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(left: 10),
            decoration:  BoxDecoration(color: Color(0xff26292F),
            borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft:Radius.circular(15))),
            height: size.height * 0.2,
              child: Column(
                children: [
                  Spacer(),
                  ListTile(
                    title: Text("Username",style: TextStyle(color: Color(0xffC0C0C0),fontSize: 20),),
                    leading: Container(
                      child: Image.asset("image/usericon.png",scale: 2.2,),
                    ),
                  ),
                  Spacer(),
                  ListTile(
                    title: Text("Username@email.com",style: TextStyle(color: Color(0xffC0C0C0),fontSize: 20),),
                    leading: Container(
                      child: Image.asset("image/mailicon.png",scale: 2.2,),
                    ),
                  ),
                  Spacer(flex: 5,),
                ],
              )

          );
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Aprove",style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.60,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(0xff26292F),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Image.asset("image/Card 2 bottomcrop.png"),
                  Spacer(),
                  Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: size.width * 0.010,),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return CheckPage();
                        },));
                      }, child: Text("Check",style: TextStyle(color: Color(0xff07BCD6),fontSize: 16),),),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _showModalBottomSheet(context);
                            });
                          },
                          child: Image.asset("image/Ic_Info.png",scale:3,)),
                      SizedBox(width: size.width * 0.020,),

                    ],
                  ),
                  Spacer()
                ],
              ),
            );
          },),
      ),
    );
  }
}

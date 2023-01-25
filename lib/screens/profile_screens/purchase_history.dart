import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_purchase_history_box.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);

  @override
  State<PurchaseHistory> createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Purchase History",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15,right: 15,),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Spacer(flex: 3,),
            Text("Current plan",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 20),),
            Spacer(),
            Container(
              height: size.height * 0.14,
              width: size.width,
              decoration: BoxDecoration(
                color: Color(0xff30333A),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15,right: 15),
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(children: [
                      Text("Breaker Monthly",style: TextStyle(color: Colors.white,fontSize: 18),),
                      Spacer(),
                      Text("\$750",style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],),
                    Row(children: [
                      Text("Next Billing Date",style: TextStyle(color: Colors.white,fontSize: 18),),
                      Spacer(),
                      Text("29/11/22",style: TextStyle(color: Colors.white,fontSize: 18),)
                    ],),
                  ],
                ),
              )
            ),
            Spacer(flex: 3,),
            Text("Previous plan",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 20),),
            Spacer(),
            CustomePurchaseHistoryBox(text: "Breaker Monthly", bill: "\$750", date: "28/08/22"),
            Spacer(),
            CustomePurchaseHistoryBox(text: "Breaker Monthly", bill: "\$17.50", date: "28/08/22"),
            Spacer(),
            CustomePurchaseHistoryBox(text: "Breaker Monthly", bill: "\$750", date: "28/08/22"),
            Spacer(flex: 10,),
          ],
        ),
      ),
    );
  }
}

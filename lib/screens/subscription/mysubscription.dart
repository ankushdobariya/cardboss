import 'package:flutter/material.dart';
import 'package:subscription/screens/payment/paymentpage.dart';
import 'package:subscription/screens/subscription/subscripton_package.dart';

  class MySubscription extends StatefulWidget {
  const MySubscription({Key? key}) : super(key: key);

  @override
  State<MySubscription> createState() => _MySubscriptionState();
}

class _MySubscriptionState extends State<MySubscription> {

    TextEditingController enterAmount = TextEditingController();

  String amount = " ";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text("My Subscription"),
        actions: [
          PopupMenuButton(
            offset:const Offset(20, 40),
            onSelected: (value) {

              },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 1,child: Text("1."),),
              const PopupMenuItem(value: 2,child: Text("2."),),
              const PopupMenuItem(value: 3,child: Text("3."),),
              const PopupMenuItem(value: 4,child: Text("4."),),
              const PopupMenuItem(value: 5,child: Text("5."),),
              const PopupMenuItem(value: 6,child: Text("6."),),
              const PopupMenuItem(value: 7,child: Text("7."),),
              const PopupMenuItem(value: 8,child: Text("8."),),
              const PopupMenuItem(value: 9,child: Text("9."),),
              const PopupMenuItem(value: 10,child: Text("10."),),
            ],)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height * 0.88,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Card(
                  color: Theme.of(context).backgroundColor,
                  child: Container(
                      height: size.height * 0.140,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [Color(0xff065945), Color(0xff18B872)])),
                      alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Breaker Monthly",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                                Text("0 Card left",style: TextStyle(color: Colors.white,fontSize: 18),),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text("Cards 501+ cost \$1.75 each",style: TextStyle(color: Color(0xffDFDFDF),fontSize: 18),),
                          ),
                        ],
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Card(
                  color: Theme.of(context).backgroundColor,
                  child: Container(
                    height: size.height * 0.32,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [Color(0xff065945), Color(0xff18B872)])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(flex: 2,),
                          const Text("Buy more Cards",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                          const Spacer(),
                          const Text("Cards Count",style: TextStyle(color: Color(0xffDFDFDF),fontSize: 18),),
                          const Spacer(),
                          Container(
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius:BorderRadius.circular(6)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child:
                              Center(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      amount = value;
                                    });
                                  },
                                  cursorColor: Colors.white,
                                  style: const TextStyle(color: Colors.white,fontSize: 17),
                                  controller: enterAmount,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Enter count",
                                      hintStyle: const TextStyle(color: Color(0xffDCDCDC),fontSize: 17),
                                      suffixIcon: IconButton(onPressed: () {

                                      }, icon:const Icon( Icons.arrow_drop_down),color: Colors.white,iconSize: 30,),
                                      border: InputBorder.none
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          amount.isNotEmpty ?  Text("\$:$amount", style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),):
                          const Text("\$-----", style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400),),
                          const Spacer(),
                          Center(
                            child: Container(
                                height: size.height * 0.06,
                                width: size.width * 0.85,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6)),
                                child: amount.isEmpty
                                    ? const Text(
                                  "Proceed to Pay",
                                  style: TextStyle(
                                      color: Color(0xffB9B9B9),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                )
                                    : TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return const PaymentPage();
                                      },
                                    ));
                                  },
                                  child: const Text(
                                    "Proceed to Pay",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 7,),
              Container(
                margin: const EdgeInsets.only(left: 15, right: 15),
                height: size.height * 0.07,
                width: size.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: const Color(0xff07BCD6),
                    borderRadius: BorderRadius.circular(8)),
                child: TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SubscriptionPackage();
                  },));
                }, child: const Text("Change Subscription",style: TextStyle(color: Colors.white,fontSize: 23,fontWeight: FontWeight.w400),),),
              ),
              const Spacer(),
              const Text(
                "Cancel Subscription",
                style: TextStyle(color: Color(0xffB9B9B9,),fontSize: 20,
                  decoration: TextDecoration.underline,

                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}

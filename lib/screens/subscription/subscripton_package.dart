
import 'package:flutter/material.dart';
import 'package:subscription/customwidget/subscriptionpackage_widget.dart';
import 'package:subscription/screens/payment/paymentpage.dart';

class SubscriptionPackage extends StatefulWidget {
  const SubscriptionPackage({Key? key}) : super(key: key);

  @override
  State<SubscriptionPackage> createState() => _SubscriptionPackageState();
}

class _SubscriptionPackageState extends State<SubscriptionPackage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: const Text("Subscription"),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            children: [
              Card(
                color: Theme.of(context).backgroundColor,
                child: Container(
                    height: size.height * 0.35,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: const LinearGradient(
                            colors: [Color(0xffBA710F), Color(0xffF59A25)])),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Premium Pack",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Rs 19.19",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          const Text(
                            "7 Cards per month",
                            style: TextStyle(color: Colors.white, fontSize: 19),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text(
                            "Cards 8-20 cost \$4.00 each",
                            style: TextStyle(
                                color: Color(0xffDFDFDF), fontSize: 18),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text(
                            "Cards 8-20 cost \$4.00 each",
                            style: TextStyle(
                                color: Color(0xffDFDFDF), fontSize: 18),
                          ),
                          const Spacer(
                            flex: 1,
                          ),
                          const Text(
                            "Cards 8-20 cost \$4.00 each",
                            style: TextStyle(
                                color: Color(0xffDFDFDF), fontSize: 18),
                          ),
                          const Spacer(
                            flex: 8,
                          ),
                          Center(
                            child: Container(
                              height: size.height * 0.060,
                              width: size.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7)),
                              alignment: Alignment.center,
                              child: TextButton(onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return PaymentPage();
                                },));
                              }, child: Text(
                                "Subscribe",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              )),
                            ),
                          ),
                          const Spacer(
                            flex: 4,
                          ),
                        ],
                      ),
                    )),
              ),
              CustomCard(
                  height: size.height * 0.25,
                  width: size.width,
                  title: "Platinum Monthly",
                  subTitle: "100 card subscription",
                  offer: "Cards 101+ cost \$2 each",
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PaymentPage();
                    },));
                  },
                  color1: Color(0xff253266),
                  color2: Color(0xffA72893),
                  price: "\$750.00"),
              CustomCard(
                  height: size.height * 0.25,
                  width: size.width,
                  title: "Breaker Monthly",
                  subTitle: "500 card subscription",
                  offer: "Cards 501+ cost \$1.75 each",
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PaymentPage();
                    },));
                  },
                  color1: Color(0xff065945),
                  color2: Color(0xff18B872),
                  price: "\$750.00"),
              CustomCard(
                  height: size.height * 0.25,
                  width: size.width,
                  title: "Commercial Monthly",
                  subTitle: "1000 card with subscription",
                  offer: "Cards 1001+ cost \$1.50 each",
                  ontap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PaymentPage();
                    },));
                  },
                  color1: Color(0xff304BBE),
                  color2: Color(0xff4F9BF3),
                  price: "\$1250.00"),
            ],
          ),
        ),
      ),
    );
  }
}



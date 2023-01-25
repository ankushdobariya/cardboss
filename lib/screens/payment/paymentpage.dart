import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  bool _gPay = true;
  bool _cardPay = false;
  bool _save = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFF181A1E),
        appBar:AppBar(
          elevation: 0,
          title: Text(
            "Payment",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          centerTitle: false,
          backgroundColor: Color(0xFF181A1E),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: size.height * 0.9,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: size.height * 0.020,),
                Container(
                  height: size.height * 0.130,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Color(0xff30333A)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Subtotal",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "\$15.00",
                              style: TextStyle(color: Colors.white
                              ),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        Row(
                          children: [
                            Text(
                              "Tax",
                              style: TextStyle(color: Colors.white),
                            ),
                            Spacer(),
                            Text(
                              "\$1.30",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Divider(
                          thickness: 2,
                          color: Color(0xff404040),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                            Spacer(),
                            Text(
                              "\$16.30",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Text(
                  "Pay Using",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Row(
                  children: [
                    TextButton.icon(
                        onPressed: () {
                      setState(() {
                        _gPay = true;
                        _cardPay = false;
                      });
                    }, icon: _gPay ?Icon(Icons.radio_button_checked,color: Color(0xff07BCD6)):Icon(Icons.radio_button_off,color: Color(0xff07BCD6)), label: Text("Gpay",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 17),)),
                    TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _cardPay = true;
                            _gPay = false;
                          });
                        }, icon: _cardPay ?Icon(Icons.radio_button_checked,color: Color(0xff07BCD6),):Icon(Icons.radio_button_off,color: Color(0xff07BCD6)), label: Text("Card Payment",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 17),),),
                  ],
                ),
                SizedBox(height: size.height * 0.010),
                Visibility(
                  visible: _gPay,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "UPI ID",
                        style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                          height: size.height * 0.060,
                          decoration: BoxDecoration(
                              color: Color(0xff30333A),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: TextField(
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xff7A7A7A)),
                                  hintText: "Enter Upi ID",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Visibility(
                  visible: _cardPay,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Card Name",
                        style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          height: size.height * 0.060,
                          decoration: BoxDecoration(
                              color: Color(0xff30333A),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: TextField(
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 17, color: Color(0xff7A7A7A)),
                                hintText: "Please Select Card",
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Card Information",
                        style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                          padding: EdgeInsets.only(left: 10),
                          height: size.height * 0.060,
                          decoration: BoxDecoration(
                              color: Color(0xff30333A),
                              borderRadius: BorderRadius.circular(6)),
                          child: Center(
                            child: TextField(
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    fontSize: 17, color: Color(0xff7A7A7A)),
                                hintText: "Card Number",
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            height: size.height * 0.060,
                            width: size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Color(0xff30333A),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: TextField(
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xff7A7A7A)),
                                  hintText: "MM/YYYY",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            height: size.height * 0.060,
                            width: size.width * 0.45,
                            decoration: BoxDecoration(
                                color: Color(0xff30333A),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                              child: TextField(
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xff7A7A7A)),
                                  hintText: "CVV",
                                  suffixIcon: Icon(Icons.wallet,color: Color(0xff7A7A7A),),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Text(
                        "Country Or Region",
                        style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15),
                      ),
                      SizedBox(
                        height: size.height * 0.010,
                      ),
                      Container(
                          height: size.height * 0.060,
                          decoration: BoxDecoration(
                              color: Color(0xff30333A),
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Center(
                              child: TextField(
                                style: TextStyle(fontSize: 20, color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      fontSize: 17, color: Color(0xff7A7A7A)),
                                  hintText: "Please Select",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: () {
                            setState(() {
                              _save =! _save;
                            });
                          }, icon:_save == false ? Icon(Icons.check_box_outline_blank,color: Colors.white,) : Icon(Icons.check_box,color: Colors.white,)),
                          Text("Save this card for future Payment", style: TextStyle(color: Color(0xffCBCBCB), fontSize: 15))
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                NextPageButton(
                  text: "Pay \$16.30",
                  onPress: () {},
                ),
                SizedBox(
                  height: size.height * 0.040,
                )
              ]),
            ),
          ),
        ));
  }
}

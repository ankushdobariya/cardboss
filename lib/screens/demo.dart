import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  XFile? image1;
  String img = '';
  bool ready = false;
  bool ready1 = false;
  bool showPreview = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xff181A1E),
        appBar: AppBar(
          backgroundColor: showPreview
              ? Colors.black.withOpacity(0.6)
              : const Color(0xff181A1E),
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            'Home',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color:
                showPreview ? Colors.white.withOpacity(0.6) : Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  _showDialogBox();
                },
                child: Text(
                  "Clear",
                  style: TextStyle(
                      color: showPreview
                          ? const Color(0xff07BCD6).withOpacity(0.6)
                          : const Color(0xff07BCD6)),
                ))
          ],
        ),
        body: Container(
          height: size.height,
          width: double.infinity,
          decoration: const BoxDecoration(color: Color(0xff181A1E)),
          child: Stack(
            children: [
              Column(
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 16,
                              ),
                              child: Text(
                                "Front Side",
                                style: TextStyle(
                                    color: Color(0xffCBCBCB), fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 16, right: 8),
                              child: Column(
                                children: [
                                  Container(
                                      height: size.height / 3.6,
                                      width: size.width * 0.5,
                                      decoration: BoxDecoration(
                                          color: const Color(0xff30333A),
                                          borderRadius:
                                          BorderRadius.circular(6)),
                                      child: Stack(
                                        children: [
                                          image == null
                                              ? Center(
                                            child: GestureDetector(
                                              child: Container(
                                                height:
                                                size.height * 0.050,
                                                width:
                                                size.height * 0.050,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 2,
                                                      color: const Color(
                                                          0xff07BCD6)),
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(90),
                                                ),
                                                child: const Icon(
                                                    Icons.add,
                                                    color: Color(
                                                        0xff07BCD6)),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  ready = true;
                                                  ready1 = false;
                                                  _showModalSheet(
                                                      context);
                                                });
                                              },
                                            ),
                                          )
                                              : ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(6),
                                            child: Image.file(
                                                File(image!.path),
                                                height: size.height / 3.6,
                                                width: size.width * 0.5,
                                                fit: BoxFit.cover),
                                          ),
                                          Align(
                                              alignment: Alignment.bottomRight,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    bottom: 8, right: 8),
                                                height: size.width * 0.075,
                                                width: size.width * 0.075,
                                                decoration: BoxDecoration(
                                                    color: image == null
                                                        ? const Color(
                                                        0xff454E50)
                                                        : Colors.white,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        90)),
                                                child: GestureDetector(
                                                    onTap: () {
                                                      if (image == null) {
                                                        null;
                                                      } else {
                                                        img = image!.path;
                                                        _showDialogBox1(
                                                            context);
                                                      }
                                                    },
                                                    child: image == null
                                                        ? Image.asset(
                                                        "assets/image/Group 38.png")
                                                        : Image.asset(
                                                        "assets/image/Group 38(2).png")),
                                              ))
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            Container(
                                alignment: Alignment.center,
                                margin:
                                const EdgeInsets.only(left: 16, right: 8),
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                height: size.height * 0.050,
                                width: size.width * 0.5,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      ready = true;
                                      ready1 = false;
                                      _showModalSheet(context);
                                    });
                                  },
                                  child: const Text(
                                    "Reupload",
                                    style: TextStyle(
                                        color: Color(0xff07BCD6), fontSize: 14),
                                    textAlign: TextAlign.end,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 8,
                              ),
                              child: Text(
                                "Back Side",
                                style: TextStyle(
                                    color: Color(0xffCBCBCB), fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 8, right: 16),
                              child: Container(
                                  height: size.height / 3.6,
                                  width: size.width * 0.5,
                                  decoration: BoxDecoration(
                                      color: const Color(0xff30333A),
                                      borderRadius: BorderRadius.circular(6)),
                                  child: Stack(
                                    children: [
                                      image1 == null
                                          ? Center(
                                        child: GestureDetector(
                                          child: Container(
                                            height: size.height * 0.050,
                                            width: size.height * 0.050,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: const Color(
                                                      0xff07BCD6)),
                                              borderRadius:
                                              BorderRadius.circular(
                                                  90),
                                            ),
                                            child: const Icon(Icons.add,
                                                color: Color(0xff07BCD6)),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              ready = false;
                                              ready1 = true;
                                              _showModalSheet(context);
                                            });
                                          },
                                        ),
                                      )
                                          : ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(6),
                                        child: Image.file(
                                            File(image1!.path),
                                            height: size.height / 3.6,
                                            width: size.width * 0.5,
                                            fit: BoxFit.cover),
                                      ),
                                      Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 8, right: 8),
                                            height: size.width * 0.075,
                                            width: size.width * 0.075,
                                            decoration: BoxDecoration(
                                                color: image1 == null
                                                    ? const Color(0xff454E50)
                                                    : Colors.white,
                                                borderRadius:
                                                BorderRadius.circular(90)),
                                            child: GestureDetector(
                                                onTap: () {
                                                  if (image1 == null) {
                                                    null;
                                                  } else {
                                                    img = image1!.path;
                                                    _showDialogBox1(context);
                                                  }
                                                },
                                                child: image1 == null
                                                    ? Image.asset(
                                                    "assets/image/Group 38.png")
                                                    : Image.asset(
                                                    "assets/image/Group 38(2).png")),
                                          ))
                                    ],
                                  )),
                            ),
                            Container(
                                margin:
                                const EdgeInsets.only(left: 8, right: 16),
                                decoration: const BoxDecoration(
                                    color: Colors.transparent),
                                height: size.height * 0.050,
                                width: size.width * 0.5,
                                alignment: Alignment.center,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      ready = false;
                                      ready1 = true;
                                      _showModalSheet(context);
                                    });
                                  },
                                  child: const Text(
                                    "Reupload",
                                    style: TextStyle(
                                        color: Color(0xff07BCD6), fontSize: 14),
                                    textAlign: TextAlign.end,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                    const EdgeInsets.only(top: 30, left: 16, bottom: 5),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "My Subscription",
                      style: TextStyle(color: Color(0xffCBCBCB), fontSize: 14),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    width: double.infinity,
                    height: size.height * 0.25,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: const Color(0xff30333A),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.02,
                                left: 20,
                                bottom: size.height * 0.03),
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text("Breaker Monthly",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 9, bottom: 5, left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: const [
                                  Text("0 cards",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text("remanining from your plan",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding:
                            EdgeInsets.only(top: 8, bottom: 15.0, left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text("Cards 501+cost6 \$1.75 each",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400)),
                            ),
                          ),
                          const Spacer(),
                          const Divider(
                            height: 2,
                            color: Colors.white24,
                          ),
                          const Spacer(),
                          SizedBox(
                            height: size.height * 0.05,
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Buy More Cards",
                                style: TextStyle(
                                    color: Color(0xFF00E5FF),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xff07BCD6),
                        borderRadius: BorderRadius.circular(6)),
                    height: size.height * 0.06,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () async {
                        setState(() {
                          ready = !ready;
                        });
                        _showModalSheet(context);
                      },
                      child: const Text(
                        "Upload ",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  void _showModalSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)),
            child: Container(
              decoration: const BoxDecoration(color: Color(0xff26292F)),
              padding: const EdgeInsets.all(10.0),
              height: size.height / 4,
              child: Padding(
                padding: EdgeInsets.only(
                  top: size.height * 0.050,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: size.height * 0.090,
                          width: size.height * 0.090,
                          decoration: BoxDecoration(
                              color: const Color(0xff181A1E),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () async {
                                ready == true
                                    ? image = await picker.pickImage(
                                    source: ImageSource.camera)
                                    : image1 = await picker.pickImage(
                                    source: ImageSource.camera);
                                setState(() {});
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: size.height * 0.03,
                              )),
                        ),
                        const Text(
                          "Take a Photo",
                          style:
                          TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: size.height * 0.090,
                          width: size.height * 0.090,
                          decoration: BoxDecoration(
                              color: const Color(0xff181A1E),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () async {
                                ready == true
                                    ? image = await picker.pickImage(
                                    source: ImageSource.gallery)
                                    : image1 = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                  //update UI
                                });
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.photo_camera_back_outlined,
                                size: size.height * 0.03,
                                color: Colors.white,
                              )),
                        ),
                        const Text(
                          "Upload from gallary",
                          style:
                          TextStyle(color: Color(0xffFFFFFF), fontSize: 12),
                        )
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _showDialogBox() {
    // width: size.width / 2.8,
    final size = MediaQuery.of(context).size;
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          actionsPadding: const EdgeInsets.only(bottom: 10, top: 10),
          actionsAlignment: MainAxisAlignment.center,
          insetPadding: const EdgeInsets.only(left: 24, right: 24),
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          backgroundColor: const Color(0xff26292F),
          title: Container(
            padding: const EdgeInsets.all(0),
            height: size.height * 0.325,
            width: size.width * 0.9,
            color: Colors.transparent,
            child: Column(
              children: [
                Container(
                    margin: const EdgeInsets.only(top: 6, bottom: 15),
                    height: size.height * 0.065,
                    width: size.height * 0.065,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: const Image(
                      image: AssetImage("assets/image/Ic_Submitted.png"),
                      fit: BoxFit.cover,
                    )),
                const Text(
                  "Your Card is Submitted,Please\nWait for 15 minutes then you will\n get the report",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xffFFFFFF),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: const Color(0xff07BCD6)),
                        borderRadius: BorderRadius.circular(6)),
                    height: size.height * 0.055,
                    width: size.width * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Home",
                          style: TextStyle(
                              fontSize: 16, color: Color(0xff07BCD6))),
                    )),
              ],
            ),
          ),
        ));
  }

  void _showDialogBox1(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //width: size.width / 2.8,
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Column(children: [
          Container(
            margin: const EdgeInsets.only(
              top: 90,
            ),
            height: size.height / 1.5,
            width: size.width * 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(File(img)), fit: BoxFit.cover)),
            child: Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  child: Container(
                      margin: const EdgeInsets.only(right: 5),
                      height: size.height/12,
                      width: size.width/12,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/image/Group 38(2).png"),
                          ))),
                  onTap: () => Navigator.pop(context),
                )),
          )
        ]);
      },
    );
  }
}

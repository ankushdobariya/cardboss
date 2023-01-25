import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  ImagePicker picker = ImagePicker();
  XFile? profileImage;

  void _showModalBottomSheetprofile(BuildContext context) {
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
                    top: size.height * 0.050, left: 55, right: 55),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          height: size.height * 0.090,
                          width: size.height * 0.090,
                          decoration: BoxDecoration(
                              color: Color(0xff181A1E),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () async {
                                profileImage = await picker.pickImage(
                                    source: ImageSource.camera);
                                setState(() {});
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
                          TextStyle(color: Colors.white, fontSize: 12),
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
                                profileImage = await picker.pickImage(
                                    source: ImageSource.gallery);
                                setState(() {
                                });
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
                          TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF1E1E1E),
      appBar: AppBar(
        title: Text("My Profile"),
        elevation: 0,
        backgroundColor: Color(0xFF1E1E1E),
      ),
      body: SingleChildScrollView(
        child:Container(
          height: size.height * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(
              children: [

                SizedBox(height: size.height * 0.040,),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      alignment: Alignment.center,
                      height: size.width * 0.4,
                      width: size.width * 0.4,
                      decoration: const BoxDecoration(
                          color: Colors.transparent, shape: BoxShape.circle),
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                                alignment: Alignment.bottomRight,
                                height: size.width * 0.340,
                                width: size.width * 0.340,
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(width: 2, color: Colors.white),
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: profileImage == null
                                          ? ClipOval(
                                        child: Image.asset(
                                            "image/Profile 1.png",
                                            height: size.width * 0.340,
                                            width: size.width * 0.340,
                                            fit: BoxFit.cover),
                                      )
                                          : ClipOval(
                                        child: Image.file(
                                            File(profileImage!.path),
                                            height: size.width * 0.340,
                                            width: size.width * 0.340,
                                            fit: BoxFit.cover),
                                      )),
                                )),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: GestureDetector(
                              child: Container(
                                  alignment: Alignment.center,
                                  margin:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                                  height: size.height * 0.040,
                                  width: size.height * 0.040,
                                  decoration: const BoxDecoration(
                                      color: Color(0xff07BCD6),
                                      shape: BoxShape.circle),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: size.width * 0.060,
                                    color: Colors.white,
                                  )),
                              onTap: () {
                                _showModalBottomSheetprofile(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    )),
                Spacer(),
                Container(
                  height: size.height * 0.080,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey)
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: 'Name',
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.080,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey)
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey),
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: 'Email',
                        border: InputBorder.none
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.080,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey)
                    ),
                  ),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.grey),
                        labelText: 'Phone Number',
                        border: InputBorder.none
                    ),
                  ),
                ),
                Spacer(flex: 3,),
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                        fixedSize: Size(size.width * 0.9, size.height * 0.055),
                        side: BorderSide(color: Color(0xff07BCD6))),
                    child: const Text(
                      "Logout",
                      style: TextStyle(color: Color(0xff07BCD6)),
                    )), Spacer(),
              ],
            ),
          ),
        ),
      )
    );
  }
}

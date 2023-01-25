import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';
import 'package:subscription/screens/subscription/mysubscription.dart';

class Home extends StatefulWidget {
   const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  ImagePicker picker = ImagePicker();

  CroppedFile? _croppedFileFront;
  CroppedFile? _croppedFileBack;

  XFile? frontImage;
  XFile? backImage;

  bool frontPhoto = false;
  bool backPhoto  =  false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text("Home",style:TextStyle(color: Colors.white,fontSize: 25),),
        actions: [
          TextButton(onPressed: () {
            setState((){
              // _showDialogBox();
              frontImage = null;
              backImage = null;
            });
          }, child: Text("Clear",style: TextStyle(color: Color(0xff07BCD6),fontSize: 17,fontWeight: FontWeight.w400),))
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(),
            Row(
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Front Side",style:TextStyle(color: Color(0xffCBCBCB),fontSize :18),),
                    SizedBox(height: size.height * 0.010,),
                    Container(
                      height: size.height * 0.30,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                          color: Color(0xff30333A),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Stack(
                        children:[
                          frontImage == null ?
                          Center(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    frontPhoto = true;
                                    backPhoto = false;
                                  });
                                  _showModalBottomSheet(context);
                                },
                                child: SizedBox(
                                    height: size.height * 0.06,
                                    child: Image.asset(
                                      "image/Ic_Add Card.png",
                                      scale: 2.2,
                                    ))),
                          ) : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                                  child: Center(
                                      child: Image.file(
                                    File(_croppedFileFront == null
                                        ? frontImage!.path
                                        : _croppedFileFront!.path),
                                        fit: BoxFit.fill,
                                        height: size.height * 0.30,
                                        width: size.width * 0.44,
                                  ))),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, right: 10),
                                child:frontImage == null ? Container(
                                  height: size.height * 0.045,
                                  decoration: BoxDecoration(
                                      color: Color(0xff454E50),
                                      shape: BoxShape.circle
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("image/dark arrow.png",),
                                  ),
                                ):Container(
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
                                              return Center(child: Image.file(File(
                                                  _croppedFileFront == null
                                                  ? frontImage!.path
                                                  : _croppedFileFront!.path)));
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
                    frontImage == null
                        ? Container(
                        width: size.width * 0.44,
                        alignment: Alignment.center,
                        child: TextButton(onPressed: () {

                        }, child: Text(
                          "ReUpload",
                          style: TextStyle(color: Color(0xff07BCD6).withOpacity(0.70)),
                        )))
                        : Container(
                        width: size.width * 0.44,
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed:() {
                              setState(() {
                                frontPhoto = true;
                                backPhoto = false;
                                _showModalBottomSheet(context);
                              });
                            },
                            child: Text(
                              "ReUpload",
                              style: TextStyle(color: Color(0xff07BCD6)),
                            )))
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Back Side",style:TextStyle(color: Color(0xffCBCBCB),fontSize: 18)),
                    SizedBox(height: size.height * 0.010,),
                    Container(
                      height: size.height * 0.30,
                      width: size.width * 0.44,
                      decoration: BoxDecoration(
                          color: Color(0xff30333A),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Stack(
                        children: [
                          backImage == null ?
                          Center(
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    frontPhoto = false;
                                    backPhoto = true;
                                    _showModalBottomSheet(context);
                                  });
                                },
                                child: SizedBox(
                                    height: size.height * 0.06,
                                    child: Image.asset("image/Ic_Add Card.png"))),
                          ): ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Center(child: Image.file(File(
                                  _croppedFileBack== null
                                  ? backImage!.path
                                  : _croppedFileBack!.path),
                                fit: BoxFit.fill,
                                height: size.height * 0.30,
                                width: size.width * 0.44,
                              )
                              )
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10,right: 10),
                                  child:backImage == null ? Container(
                                    height: size.height * 0.045,
                                    decoration: BoxDecoration(
                                        color: Color(0xff454E50),
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset("image/dark arrow.png",),
                                    ),
                                  ):Container(
                                    height: size.height * 0.045,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              showDialog(
                                                context: context, builder: (context) {
                                                return Center(child: Image.file(File(
                                                    _croppedFileBack == null
                                                    ? backImage!.path
                                                    : _croppedFileBack!.path)));
                                                },);
                                            });
                                          },
                                          child: Image.asset("image/arrow.png",)),
                                    ),
                                  )
                              )
                          )

                        ],
                      ),
                    ),
                    backImage == null
                        ? Container(
                        width: size.width * 0.44,
                        alignment: Alignment.center,
                        child: TextButton(onPressed: () {

                        }, child: Text(
                          "ReUpload",
                          style: TextStyle(color: Color(0xff07BCD6).withOpacity(0.50)),
                        )))
                        : Container(
                        width: size.width * 0.44,
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                frontPhoto = false;
                                backPhoto = true;
                                _showModalBottomSheet(context);
                              });
                            },
                            child: Text(
                              "ReUpload",
                              style: TextStyle(color: Color(0xff07BCD6)),
                            )))
                  ],
                ),
              ],
            ),
            Spacer(flex: 2,),
            Text("My Subscription",style:TextStyle(color: Color(0xffCBCBCB),fontSize: 17),),
            Spacer(),
            Container(
              height: size.height * 0.22,
              width: size.width ,
              decoration: BoxDecoration(
                  color: Color(0xff30333A),
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 3,),

                  Padding(

                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Breaker Monthly",style: TextStyle(color: Colors.white,fontSize: 17),),
                  ),
                  Spacer(flex: 3,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("0 cards remaining from your plan",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 16),),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Cards 501+ cost \$1.75 each",style: TextStyle(color: Color(0xffCBCBCB),fontSize: 16),),
                  ),
                  Spacer(flex: 3,),
                  Divider(color: Colors.white,),
                  SizedBox(
                    height: size.height * 0.05,
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return MySubscription();
                        },));
                      },
                      child: const Text(
                        "Buy More Cards",
                        style: TextStyle(
                            color: Color(0xFF00E5FF),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),

                ],
              ),
            ),
            Spacer(flex: 2,),
            NextPageButton(text: "Upload", onPress: () {

            },),
            Spacer(),
          ],
        ),
      ),
    );
  }
  void _showModalBottomSheet(BuildContext context) {
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
                          margin: EdgeInsets.only(bottom: 10),
                          height: size.height * 0.090,
                          width: size.height * 0.090,
                          decoration: BoxDecoration(
                              color: Color(0xff181A1E),
                              borderRadius: BorderRadius.circular(10)),
                          child: IconButton(
                              onPressed: () async {
                                frontPhoto==true? frontImage = await picker.pickImage(source: ImageSource.camera):  backImage = await picker.pickImage(source: ImageSource.camera);
                                frontPhoto==true? _cropImageFront():_cropImageBack();
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

                                frontPhoto==true?frontImage = await picker.pickImage(source: ImageSource.gallery):backImage = await picker.pickImage(source: ImageSource.gallery);
                                frontPhoto==true? _cropImageFront():_cropImageBack();
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

  Future<void> _cropImageFront() async {
    if (frontImage != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: frontImage!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFileFront = croppedFile;
        });
      }
    }
  }

  Future<void> _cropImageBack() async {
    if (backImage != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: backImage!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFileBack = croppedFile;
        });
      }
    }
  }
// void _showDialogBox() {
//   final size = MediaQuery.of(context).size;
//   showDialog(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(8))),
//         actionsPadding: const EdgeInsets.only(bottom: 10, top: 10),
//         contentPadding: const EdgeInsets.only(top: 20),
//         actionsAlignment: MainAxisAlignment.center,
//         actions: [
//           Container(
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                   border: Border.all(
//                       width: 1, color: const Color(0xff07BCD6)),
//                   borderRadius: BorderRadius.circular(6)),
//               margin: const EdgeInsets.only(bottom: 10, top: 30),
//               height: size.height / 15.5,
//               width: size.width / 2.8,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Home",
//                     style: TextStyle(
//                         fontSize: 16, color: Color(0xff07BCD6))),
//               )),
//         ],
//         backgroundColor: const Color(0xff26292F),
//         title: Center(
//           child: Container(
//               height: size.height * 0.055,
//               width: size.width * 0.60,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(90),
//               ),
//               child: const Image(
//                 image: AssetImage("image/Ic_Submitted.png"),
//               )),
//         ),
//         content: const Text(
//           "Your Card is Submitted, Please \nWait for 15 minutes then you will\n get the report",
//           style: TextStyle(
//             color: Color(0xffFFFFFF),
//             fontSize: 16,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ));
// }
}


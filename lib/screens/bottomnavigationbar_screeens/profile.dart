import 'package:flutter/material.dart';
import 'package:subscription/screens/profile_screens/archive&blocked.dart';
import 'package:subscription/screens/profile_screens/myprofile.dart';
import 'package:subscription/screens/profile_screens/purchase_history.dart';
import 'package:subscription/screens/subscription/mysubscription.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Profile",style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.030,),
            CustomCategory(text: "My Profile", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyProfile();
              },));
            },),
            Spacer(),
            Divider(color: Colors.white,),
            Spacer(),
            CustomCategory(text: "My Subscription", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MySubscription();
              },));
            },),
            Spacer(),
            Divider(color: Colors.white,),
            Spacer(),
            CustomCategory(text: "Purchase History", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PurchaseHistory();
              },));
            },),
            Spacer(),
            Divider(
              color: Colors.white,
            ),
            Spacer(),
            CustomCategory(text: "Archived & Blocked", onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ArchiveAndBlocked();
              },));
            },),
            Spacer(),
            Divider(
              color: Colors.white,
            ),
            Spacer(),
            CustomCategory(text: "Contact Us", onTap: () {

            },),
            Spacer(),
            Divider(
              color: Colors.white,
            ),
            Spacer(flex: 10,),
          ],
        ),
      ),
    );
  }
}

class CustomCategory extends StatelessWidget {
  const CustomCategory({Key? key, required this.text, required this.onTap}) : super(key: key);
  
  final String  text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(text,style: TextStyle(color: Colors.white,fontSize: 18),),
            Spacer(),
            Icon(Icons.arrow_forward_ios_sharp,color: Colors.white,),
          ],
        )
    );
  }
}



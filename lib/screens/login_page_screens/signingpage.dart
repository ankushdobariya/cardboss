import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';
import 'package:subscription/screens/homepage.dart';
import 'package:subscription/screens/login_page_screens/loginpage.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  TextEditingController Name = TextEditingController();

  bool nameStatus =false;
  bool emailStatus = false;
  bool passwordStatus = false;

  String emailMsg ="";
  bool hidePassword =true;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: size.height * 0.1,),
                Text("Create New Account",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                SizedBox(height: size.height * 0.010,),
                Text("Please fill in the form to continue",style: TextStyle(color: Color(0xff6D6D6D),fontSize: 20),),
                SizedBox(height: size.height * 0.060,),
                Text("Full Name",style: TextStyle(color: Color(0xffCBCBCB)),),
                Spacer(),
                TextField(
                  onTap: () {
                    setState(() {

                      if(Name.text.isEmpty){
                        nameStatus =true;

                      }
                    });
                  },
                  onChanged: (value) {
                    setState(() {


                      if(Name.text.isEmpty){
                        nameStatus =true;

                      }else{
                        nameStatus=false;
                      }
                    });
                  },
                  controller: Name,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.white,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      errorText: nameStatus ? "Enter Name" : null,
                      fillColor: Color(0xff30333A),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:BorderSide.none,
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                ),
                Spacer(flex: 2,),
                Text("Email",style: TextStyle(color: Color(0xffCBCBCB)),),
                Spacer(),
                TextField(
                  onTap: () {
                    setState(() {
                      if(Email.text.isEmpty)
                      {
                        emailStatus = true;
                        emailMsg="Please Enter Email";
                        setState(() {});
                      }
                    });
                  },
                  onChanged: (value) {
                    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email.text);
                    setState(() {
                      if(Email.text.isEmpty)
                      {
                        emailStatus = true;
                        emailMsg="Please Enter Email";
                        setState(() {});

                      }
                      else if (!emailValid)
                      {
                        emailStatus=true;
                        emailMsg="Please Enter valid Email";
                        setState(() {});


                      }else{
                        emailStatus=false;
                      }

                    });
                  },
                  controller: Email,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.white,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      errorText: emailStatus ? emailMsg : null,
                      fillColor: Color(0xff30333A),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:BorderSide.none,
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                ),
                Spacer(flex: 2,),
                Text("Password",style: TextStyle(color: Color(0xffCBCBCB)),),
                Spacer(),
                TextField(
                  onTap: () {
                    setState(() {
                      if(Password.text.isEmpty)
                      {
                        passwordStatus=true;
                        setState(() {});

                      }
                    });
                    },
                  onChanged: (value) {
                    setState(() {
                      if(Password.text.isEmpty)
                      {
                        passwordStatus=true;
                        setState(() {});

                      }else{
                        passwordStatus=false;
                      }

                    });
                  },
                  controller: Password,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.white,
                  obscureText: hidePassword,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: () {
                        hidePassword =!hidePassword;
                        setState(() {});


                      },icon: hidePassword ? const Icon(Icons.visibility,color:Colors.grey) : const Icon(Icons.visibility_off,color:Colors.grey)),
                      errorText: passwordStatus ? "Enter Password" : null,
                      fillColor: Color(0xff30333A),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide:BorderSide.none,
                          borderRadius: BorderRadius.circular(7)
                      )
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("Forgot Password?",style: TextStyle(color: Color(0xff07BCD6)),),),
                Spacer(flex: 5,),
                NextPageButton(text: "Log In", onPress: () {

                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email.text);

                  if(Name.text.isEmpty){
                    nameStatus =true;
                    setState(() {

                    });
                  }
                  else if(Email.text.isEmpty)
                  {
                    emailStatus = true;
                    emailMsg="Please Enter Email";
                    setState(() {});

                  }
                  else if (!emailValid)
                  {
                    emailStatus=true;
                    emailMsg="Please Enter valid Email";
                    setState(() {});


                  }
                  else if(Password.text.isEmpty)
                  {
                    passwordStatus=true;
                    setState(() {});
                  }
                  else{
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                      return HomePage();
                    },));
                  }
                },),
                Spacer(flex: 16,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?",style: TextStyle(color: Color(0xffCBCBCB,),fontSize: 16),),
                    TextButton(onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      },));
                    }, child: Text("Log In",style: TextStyle(color: Color(0xff07BCD6)),),)
                  ],
                )


              ],
            ),
          ),
        ),
      )
    );
  }

}

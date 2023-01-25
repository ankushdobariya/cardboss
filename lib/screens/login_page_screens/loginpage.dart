import 'package:flutter/material.dart';
import 'package:subscription/customwidget/custom_nextpage_button.dart';
import 'package:subscription/screens/homepage.dart';
import 'package:subscription/screens/login_page_screens/signingpage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  bool emailStatus = false;
  bool passwordStatus = false;

  String emailmsg ="";
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
                Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),
                SizedBox(height: size.height * 0.010,),
                Text("Please Log In to your account",style: TextStyle(color: Color(0xff6D6D6D),fontSize: 20),),
                SizedBox(height: size.height * 0.060,),
                Text("Email",style: TextStyle(color: Color(0xffCBCBCB)),),
                Spacer(),
                TextField(
                  onTap: () {
                    setState(() {

                      if(Email.text.isEmpty)
                      {
                        emailStatus = true;
                        emailmsg="Please Enter Email";
                        setState(() {});

                      }
                    });
                  },
                  onChanged: (value) {
                    setState(() {

                      bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(Email.text);

                      if(Email.text.isEmpty)
                      {
                        emailStatus = true;
                        emailmsg="Please Enter Email";
                        setState(() {});

                      }
                      else if (!emailValid)
                      {
                        emailStatus=true;
                        emailmsg="Please Enter valid Email";
                        setState(() {});
                      }
                      else{
                        emailStatus = false;
                      }

                    });
                  },
                  controller: Email,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.white,
                cursorHeight: 25,
                decoration: InputDecoration(
                errorText: emailStatus ? emailmsg : null,
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
                  controller: Password,
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
                        passwordStatus = false;
                      }

                    });
                  },
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  cursorColor: Colors.white,
                  obscureText: hidePassword,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(onPressed: () {
                        hidePassword =!hidePassword;
                        setState(() {});


                      },icon: hidePassword ? const Icon(Icons.visibility,color:Colors.grey) : const Icon(Icons.visibility_off,color:Colors.grey)),
                    fillColor: Color(0xff30333A),
                      filled: true,
                      errorText: passwordStatus ? "Please Enter Password" : null,
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



                  if(Email.text.isEmpty)
                  {
                    emailStatus = true;
                    emailmsg="Please Enter Email";
                    setState(() {});

                  }
                  else if (!emailValid)
                  {
                    emailStatus=true;
                    emailmsg="Please Enter valid Email";
                    setState(() {});


                  }
                  else if(Password.text.isEmpty)
                  {
                    passwordStatus=true;
                    setState(() {});

                  }
                  else{
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return HomePage();
                    },));
                  }
                },),
                Spacer(flex: 19,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account ?",style: TextStyle(color: Color(0xffCBCBCB,),fontSize: 16),),
                    TextButton(onPressed: () {

                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) {
                        return SignInPage();
                      },));
                    }, child: Text("Sign Up",style: TextStyle(color: Color(0xff07BCD6)),),)
                  ],
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:data_demo/modal/user_modal.dart';
import 'package:data_demo/pages/home_page.dart';
import 'package:data_demo/services/db_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUpPage extends StatefulWidget {

  static final String id = 'signup_page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {


  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final numberController = TextEditingController();

  void _doLogin(){
    String username = emailController.text.toString().trim();
    String password = addressController.text.toString().trim();
    String number = numberController.text.toString().trim();

    var user = new User(username: username,password:password,number:number);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.teal[500]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text("Welcome",style: TextStyle(color: Colors.white54,fontSize: 18),),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(top: 80),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Text("Email",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 8,),
                      Container(
                        margin: EdgeInsets.only(left: 50,right: 50),
                        width: 350,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Enter Email",
                            hintStyle: TextStyle(color: Colors.grey[400],fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50,top: 30),
                        child: Text("Number",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        margin: EdgeInsets.only(left: 50,right: 50),
                        width: 350,
                        child: TextField(
                          controller: numberController,
                          decoration: InputDecoration(
                            hintText: "Enter Number",
                            hintStyle: TextStyle(color: Colors.grey[400],fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 50,top: 30),
                        child: Text("Address",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        margin: EdgeInsets.only(left: 50,right: 50),
                        width: 350,
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            hintText: "Enter Address",
                            hintStyle: TextStyle(color: Colors.grey[400],fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 40,top: 50),
                        width: 330,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.teal[500],
                            borderRadius: BorderRadius.circular(13)
                        ),
                        child: FlatButton(
                          onPressed: _doLogin,
                          child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30,left: 50),
                            width: 120,
                            height: 0.8,
                            color: Colors.grey[200],
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 25,left: 10),
                            child: Text("OR",style: TextStyle(color: Colors.grey[400],fontSize: 17),),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            margin: EdgeInsets.only(top: 30,left: 10),
                            width: 120,
                            height: 0.8,
                            color: Colors.grey[200],
                          ),
                        ],
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Icon(FontAwesomeIcons.facebookF,size: 20,color: Colors.indigo,),
                              margin: EdgeInsets.only(left: 110,top: 30),
                            ),
                            Container(
                              child: Icon(FontAwesomeIcons.twitter,size: 20,color: Colors.lightBlue),
                              margin: EdgeInsets.only(left: 60,top: 30),
                            ),
                            Container(
                              child: Icon(FontAwesomeIcons.instagram,size: 20,color: Colors.pink,),
                              margin: EdgeInsets.only(left: 60,top: 30),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 90,top: 50),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Already have an account?",style: TextStyle(color: Colors.grey[350],fontSize: 17),),
                                )
                              ],
                            ),
                            SizedBox(width: 7,),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    Navigator.pushReplacementNamed(context, HomePage.id);
                                  },
                                  child:Text("SigIn",style: TextStyle(color: Colors.teal,fontSize: 16,fontWeight: FontWeight.w500)),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Widgets/AppColors.dart';
import 'Widgets/CustomButton.dart';
import 'homeScreen.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String _fullname ='';
  String _username ='';
  String _email ='';
  String level = 'MALE';
  String selectvalue= '';
  String myAge='';
  String SelectedDate='';
  @override
  void initState() {
    super.initState();
    pickDob(); // Automatically open the date picker when the page loads
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding:const  EdgeInsets.all(20.0),
            child: Form(
                key: _formKey,
                child: ListView(
                    children: <Widget>[
                      const Row(
                        children:<Widget> [
                          Expanded(child: Text("Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),),),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      const Text("Create an Account",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),),
                      const SizedBox(height: 15.0),
                      const Row(
                        children:<Widget> [
                          Expanded(
                            child:Text("Enter your Name , Email and Password for signup.",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey,
                              ),),),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      TextFormField(
                        decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.themeColor,
                              width: 3,

                            ),
                          ),
                          labelText: 'UserName',
                          labelStyle: TextStyle(
                            color: AppColors.blackColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _username = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.themeColor,
                              width: 3,
                            ),
                          ),
                          labelText: 'Full Name',
                          labelStyle: TextStyle(
                            color: AppColors.blackColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _fullname = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.themeColor,
                              width: 3,

                            ),
                          ),

                          labelText: 'Email Address',
                          labelStyle: TextStyle(
                            color: AppColors.blackColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter an email address';
                          }
                          if (!value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value!;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      const Text("Gender"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: RadioListTile(

                                fillColor: MaterialStateColor.resolveWith((states) => AppColors.themeColor),
                                hoverColor: MaterialStateColor.resolveWith((states) => AppColors.blackColor),
                                title:const Text("M",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),),
                                value: 'MALE', groupValue: selectvalue, onChanged: (value){setState(() {

                              selectvalue=value.toString();
                            });}),),
                          Expanded(child:  RadioListTile(
                              fillColor: MaterialStateColor.resolveWith((states) => AppColors.themeColor),
                              hoverColor: MaterialStateColor.resolveWith((states) => AppColors.blackColor),
                              title:const Text("F",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),),
                              value: 'FEMALE', groupValue: selectvalue, onChanged: (value){setState(() {

                            selectvalue=value.toString();
                          });}),),
                          Spacer(),
                          Spacer(),
                        ],

                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          const  Text("Age"),
                          const SizedBox(width: 60),
                          Center(
                            child: TextButton(
                              onPressed: pickDob,
                              child: Text(
                                myAge.isEmpty ? 'Select Date of Birth' : 'Date of Birth $SelectedDate', // Display selected date
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.5,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Text(myAge,
                          textAlign: TextAlign.center),
                      const SizedBox(height: 40.0),
                      SizedBox(
                        height: 40,
                        child: CustomButton(
                          text: "SIGN UP",
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              Fluttertoast.showToast(
                                msg: 'Signup successful',
                                toastLength: Toast.LENGTH_LONG,
                                gravity: ToastGravity.TOP,
                                backgroundColor: AppColors.themeColor2,
                                textColor: Colors.white,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Example()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content:const  Text('Please fill in all the fields.'),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const Example()));
                      },
                          child:Text("Skip",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.themeColor,
                            ),)),
                      const SizedBox(height: 15.0),
                      const Text("By Signing up you agree to our Terms Conditions & Privacy Policy",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),),
                    ]))));
  }
  Future<void> pickDob() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.themeColor2,
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            colorScheme: ColorScheme.light(primary: AppColors.themeColor)
                .copyWith(secondary: AppColors.themeColor),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      calculateAge(pickedDate);
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      setState(() {
        SelectedDate = formattedDate;// Update myAge with the selected date
      });
    }
  }

  void calculateAge(DateTime birth) {
    DateTime now = DateTime.now();
    Duration age = now.difference(birth);
    int years = age.inDays ~/ 365;
    setState(() {
      myAge = '$years years' ;
    });
  }
}


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Widgets/AppColors.dart';
import 'Widgets/CustomButton.dart';
import 'homeScreen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController(text: "Hello, World!");
  String _fullname ='';
  String _username ='';
  String _email ='';
  String level = 'MALE';
  String selectvalue= '';
  String myAge='';
  String SelectedDate='';
  bool showvalue = false;
  @override
  void initState() {
    super.initState();
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
                          Expanded(child: Text("Create Account",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                            ),),),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        enabled: false,
                        initialValue: '555123321',
                        decoration:  InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.themeColor,
                              width: 3,
                            ),
                          ),
                          labelText: 'Phone Number',
                          labelStyle: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
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
                            fontSize: 16,
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
                            fontSize: 16,
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
                      const Text("Gender",
                      style: TextStyle(
                        fontSize: 17,
                      ),),
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
                          const Spacer(),
                          const Spacer(),
                        ],

                      ),
                      const SizedBox(height: 15),
                      const Text('Date of Birth',
                      style: TextStyle(
                        fontSize: 17,
                      ),),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:<Widget>[
                          const SizedBox(width: 30),
                          Row(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  onPressed: pickDob,
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
                                  ),
                                  child: Text(
                                    myAge.isEmpty ? 'Choose Date' : '$SelectedDate',
                                    style: const TextStyle(
                                      decorationThickness: 2.5,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                      const SizedBox(height: 50.0),
                      SizedBox(
                        height: 40,
                        child: CustomButton(
                          text: "Create Account",
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
                              );}
                          },
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Column(
                        children: [
                          const Text('By Continuing you agree to',
                          style: TextStyle(
                            fontSize: 17,
                          ),),
                           Text('AnyPick Terms & Conditions',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationThickness: 3,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: AppColors.themeColor,
                          ),),
                        ],
                      ),
                    ]
                )
            )
        )
    );
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


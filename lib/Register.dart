import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'OtpScreen.dart';
import 'Widgets/AppColors.dart';

class registerscreen extends StatefulWidget {
  const registerscreen({Key? key}) : super(key: key);

  @override
  State<registerscreen> createState() => _registerscreenState();
}

class _registerscreenState extends State<registerscreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "966",
    countryCode: "SA",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Saudi Arabia",
    example: "Saudi Arabia",
    displayName: "Saudi Arabia",
    displayNameNoCountryCode: "Saudi Arabia",
    e164Key: " ",
  );

  bool isPhoneValid() {
    return phoneController.text.length == 9;
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                           SizedBox(
                                height: 80,
                                width: 80,
                                child: Image.asset("images/logo2.png")),
                             Spacer(),
                             Spacer(),
                             Spacer(),
                             GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                                child: const Icon(Icons.close,color: Colors.black,)),

                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                              "Enter your phone number",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                         ],
                       ),

                  const SizedBox(height: 15),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(9), // Set the max length to 10
                      FilteringTextInputFormatter.digitsOnly, // Allow only digits
                    ],
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.cursorColor,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    controller: phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a phone number';
                      }
                      if (value.length != 9) {
                        return 'Please enter a valid 9-digit phone number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                    },
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "59xxxxxxx",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.greyText,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: AppColors.borderColor,
                        ),
                      ),
                      prefixIcon: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              context: context,
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 600,
                              ),
                              onSelect: (Country value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${selectedCountry.flagEmoji} ${selectedCountry.phoneCode}",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      suffixIcon: phoneController.text.length == 9
                          ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                          : phoneController.text.length >= 10
                          ? Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        child: const Icon(
                          Icons.clear,
                          color: Colors.white,
                          size: 20,
                        ),
                      )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 30),
                 ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: AppColors.themeColor,
                           elevation: 3,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(08.0)),
                           minimumSize: const Size(300, 50), //////// HERE
                         ),
                         onPressed: () {
                           if (_formKey.currentState!.validate()) {
                             _formKey.currentState!.save();
                             Fluttertoast.showToast(
                               msg: 'Code Sent Successfully',
                               toastLength: Toast.LENGTH_LONG,
                               gravity: ToastGravity.TOP,
                               backgroundColor: AppColors.SplashColor,
                               textColor: AppColors.blackColor,
                             );
                             showModalBottomSheet<dynamic>(
                                 enableDrag: true,
                                 isDismissible: true,
                                 isScrollControlled: true,
                                 shape: const RoundedRectangleBorder(
                                     borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))),
                                 context: context,
                           builder: (BuildContext context) {
                           return Container(
                           height: MediaQuery.of(context).size.height * 0.8,
                           width: double.infinity,
                           child:const otpscreen(verificationId: '',),
                           );
                           }
                             ); }
                         },
                         child: const Text('SignUp'),
                       ),
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
            ])),
          );
  }
}

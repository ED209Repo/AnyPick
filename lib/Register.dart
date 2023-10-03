import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'OtpScreen.dart';
import 'Widgets/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

   savePhoneNumberLocally(String phoneNumber) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString('phoneNumber', phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    final double screenHeight = MediaQuery.of(context).size.height;
    final double buttonHeight = screenHeight * 0.08;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 150.0),
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset("images/Logoo.png")),
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 65,
                    bottom: 50,
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.close, color: Colors.black),
                  ),
                )
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: Text(
                    AppLocalizations.of(context)!.enteryourphonenumber,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
              onChanged: (value) {
                print(value);
                setState(() {
                  phoneController.text = value;
                });
              },
              controller: phoneController,
              validator: (value) {
                if (value!.isEmpty) {
                  return AppLocalizations.of(context)!
                      .pleaseenteraphonenumber;
                }
                if (value.length != 9) {
                  return AppLocalizations.of(context)!
                      .pleaseenteravalid9digitphonenumber;
                }
                return null;
              },
              onSaved: (value) {},
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "59xxxxxxx",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
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
                  padding: const EdgeInsets.all(8.0),
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
                        fontSize: 19,
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
                      primary: AppColors.themeColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(08.0),
                      ),
                      minimumSize: const Size(300, 50), //////// HERE
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        // Save the phone number locally
                        await savePhoneNumberLocally(phoneController.text);

                        // Show a toast message
                        Fluttertoast.showToast(
                          msg: 'Code Sent Successfully',
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.TOP,
                          backgroundColor: AppColors.SplashColor,
                          textColor: AppColors.blackColor,
                        );

                        // Proceed to the next screen or show a modal bottom sheet
                        showModalBottomSheet<void>(
                          enableDrag: true,
                          isDismissible: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                          ),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.8,
                              width: double.infinity,
                              child: otpscreen(
                                verificationId: '',
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.signup),
                  ),

            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.bycontinuingyouagreeto,
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.anypicktermsconditions,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationThickness: 3,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.themeColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
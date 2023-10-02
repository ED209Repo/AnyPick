import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'SignUp.dart';
import 'Widgets/AppColors.dart';
import 'Widgets/CustomButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class otpscreen extends StatefulWidget {
  final String verificationId;
  const otpscreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 150.0),
                      child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.asset("images/logo2.png")),
                    ),
                  ],
                ),
                 Text(
                  AppLocalizations.of(context)!.verificationcode,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  AppLocalizations.of(context)!.entertheotpsenttoyourphonenumber,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.blackColor,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Pinput(
                  controller: otpController,
                  length: 6,
                  showCursor: true,
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  defaultPinTheme: PinTheme(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: AppColors.borderColor,
                      ),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      text: AppLocalizations.of(context)!.verify,
                      onPressed: ()  {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => const SignupPage()));
                      }
                  ),
                )
              ],
            ),
          );
  }
}
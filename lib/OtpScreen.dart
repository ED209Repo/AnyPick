import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'SignUp.dart';
import 'Widgets/AppColors.dart';
import 'Widgets/CustomButton.dart';

class otpscreen extends StatefulWidget {
  final String verificationId;
  otpscreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<otpscreen> createState() => _otpscreenState();
}

class _otpscreenState extends State<otpscreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 35),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                ),
                Container(
                  width: 200,
                  height: 200,
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.themeColor,
                  ),
                  child: Image.asset("images/image2.png"),
                ),
                const Text(
                  "Verification Code",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Enter the OTP  sent to your phone number",
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
                      text: "Verify",
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => SignupPage()));
                      }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
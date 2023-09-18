import 'dart:io';
import 'package:anypickdemo/Widgets/CustomButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'AccountSettings.dart';
import 'Widgets/AppColors.dart';

class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  String _fullname = '';
  String _email = '';
  ImageProvider<Object> currentProfilePhoto = const AssetImage('images/profile_photo.JPG');
  String? imagePath; // Store the path to the selected image
  File? pickedImage; // Store the picked image as a File
  String? selectedDateText; // Store the selected date text

  Future<void> changeProfilePhoto() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imagePath = pickedFile.path; // Store the new path
        pickedImage = File(imagePath!); // Store the picked image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back_ios_new,color: AppColors.whitetext),
        ),
      title: Text("Profile Settings"),
      centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.5, 0.9],
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await changeProfilePhoto();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 40.0,
                      // Use a conditional statement to check if a new image is available
                      // If so, use FileImage for the new image; otherwise, use currentProfilePhoto
                      backgroundImage: pickedImage != null
                          ? FileImage(pickedImage!)
                          : currentProfilePhoto,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: IconButton(
                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () async {
                      await changeProfilePhoto();
                    },
                  ),
                ),
              ],
            ),
          ),

          // Change your profile photo description
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '@alirana50',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // SizedBox for spacing
          const SizedBox(height: 50),

          // Full Name text field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
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
          ),

          // Email text field
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              decoration: InputDecoration(
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () async {
                final selectedDate = await pickDob();
                if (selectedDate != null) {
                  setState(() {
                    selectedDateText = 'Date of Birth $selectedDate';
                  });
                }
              },
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
              ),
              child: Text(
                selectedDateText ?? 'Change Date of Birth',
                style: const TextStyle(
                  decoration: TextDecoration.underline,
                  decorationThickness: 2.5,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          // "Save Changes" button
          Padding(
            padding: const EdgeInsets.only(top: 230, left: 10, right: 10),
            child: SizedBox(
              width: 150, 
              child:CustomButton(text: 'Save Changes', onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const AccountSettingsPage()));
              }) ,
              // child: ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => const AccountSettingsPage(),
              //       ),
              //     );
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: const Color(0xFFF5A896),
              //     padding: const EdgeInsets.symmetric(vertical: 20.0),
              //   ),
              //   child: const Text('Save Changes'),
              // ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> pickDob() async {
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
      String formattedDate = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      return formattedDate;
    }

    return null;
  }
}

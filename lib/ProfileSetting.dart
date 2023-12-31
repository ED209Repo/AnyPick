import 'dart:io';
import 'package:anypickdemo/Widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AccountSettings.dart';
import 'Widgets/AppColors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  TextEditingController _usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _fullname = '';
  String _email = '';
  ImageProvider<Object> currentProfilePhoto = const AssetImage("images/arabmanprofile2.png",);
  String? imagePath; // Store the path to the selected image
  File? pickedImage; // Store the picked image as a File
  String? selectedDateText; // Store the selected date text
  bool isLoggedIn = false ;

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

  Future<String> _getUsername()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String uname = prefs.getString('username') ?? "Guest";
    if (uname != 'Guest'){
      isLoggedIn = true ;
    }
    return uname;
  }

  void _saveUsername(String username)async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setString('username', username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        // leading: CustomBackButton(
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        title:  Text(AppLocalizations.of(context)!.profilesetting),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async {
              if  (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                _saveUsername(_usernameController.text);
                await Future.delayed(const Duration(milliseconds: 2000));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AccountSettingsPage()),
                );
              }
            },

            style: TextButton.styleFrom(
                primary: AppColors.whitetext,
                textStyle: const TextStyle(
                  fontSize: 20,
                )

            ),
            child:  Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
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
                          child: ClipOval(
                           child: Image(image: pickedImage != null
                              ? FileImage(pickedImage!)
                              : currentProfilePhoto,
                            fit: BoxFit.cover),
                          ),
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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder<String>(
                  future: _getUsername(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text('${snapshot.data}',
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,);
                    }
                  },
                ),
              ),

              // SizedBox for spacing
              const SizedBox(height: 30),

              // Full Name text field
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.themeColor,
                      width: 3,
                    ),
                  ),
                  labelText: AppLocalizations.of(context)!.fullname,
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseenteryourfullname;
                  }
                  return null;
                },
                // onSaved: (value) {
                //   _fullname = value!;
                // },
              ),
              // Email text field
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.themeColor,
                      width: 3,
                    ),
                  ),
                  labelText: AppLocalizations.of(context)!.emailaddress,
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppLocalizations.of(context)!.pleaseneteryouremail;
                  }
                  if (!value.contains('@') || !value.contains('.com')) {
                    return AppLocalizations.of(context)!.pleaseenteryourvaildemail;
                  }
                  return null;
                },
                // onSaved: (value) {
                //   _email = value!;
                // },
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () async {
                  final selectedDate = await pickDob();
                  if (selectedDate != null) {
                    setState(() {
                      selectedDateText = 'Date of Birth: $selectedDate';
                    });
                  }
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(AppColors.themeColor),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    selectedDateText ?? AppLocalizations.of(context)!.dob,
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
        ),
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
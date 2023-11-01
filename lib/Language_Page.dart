import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:anypickdemo/Widgets/custombackbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/language_change_controller.dart';

class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  late LanguageChangeController _languageController;
  Locale? _selectedLocale;

  @override
  void initState() {
    super.initState();
    _languageController = Provider.of<LanguageChangeController>(context, listen: false);
    _selectedLocale = _languageController.appLocale;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//         leading: CustomBackButton(
//   onPressed: () => Navigator.of(context).pop(),
// ),
        backgroundColor: AppColors.themeColor,
        title: const Text('Language'),
        actions: [
          TextButton(
            onPressed: () {
              if (_selectedLocale != null) {
                _languageController.changeLanguage(_selectedLocale!);
                Navigator.pop(context); // Close the language selection page
              }
            },
            child:  Text('Save',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whitetext,
              fontSize: 15,
            ),),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ListTile(
              title: const Text('English'),
              leading: Radio<Locale>(
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.themeColor),
                hoverColor: MaterialStateColor.resolveWith((states) => AppColors.blackColor),
                value: const Locale('en'),
                groupValue: _selectedLocale,
                onChanged: (Locale? value) {
                  setState(() {
                    _selectedLocale = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('العربية'),
              leading: Radio<Locale>(
                fillColor: MaterialStateColor.resolveWith((states) => AppColors.themeColor),
                hoverColor: MaterialStateColor.resolveWith((states) => AppColors.blackColor),
                value: const Locale('ar'),
                groupValue: _selectedLocale,
                onChanged: (Locale? value) {
                  setState(() {
                    _selectedLocale = value;
                  });
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
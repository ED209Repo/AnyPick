import 'package:flutter/material.dart';
import 'Widgets/AppColors.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Locale _selectedLocale = Locale('en'); // Default to English

  void _setLocale(Locale locale) {
    setState(() {
      _selectedLocale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: AppColors.themeColor,
          automaticallyImplyLeading: true, // Show the back button
          title: Text('Language Page'),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                // Implement code to save the selected language
                // Update the app's locale
                if (_selectedLocale.languageCode == 'ar') {
                  _setLocale(Locale('en')); // Switch to English
                } else {
                  _setLocale(Locale('ar')); // Switch to Arabic
                }
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40.0), // Add gap from the app bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: Text(
              'Select Language:',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 10.0), // Add some vertical gap
          DropdownButtonFormField<String>(
            value: _selectedLocale.languageCode, // Use the language code as the selected value
            onChanged: (languageCode) {
              Locale? selectedLocale;
              if (languageCode == 'ar') {
                selectedLocale = Locale('ar');
              } else {
                selectedLocale = Locale('en');
              }
              if (selectedLocale != null) {
                _setLocale(selectedLocale);
              }
            },
            items: [
              DropdownMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              DropdownMenuItem<String>(
                value: 'ar',
                child: Text('عربي'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

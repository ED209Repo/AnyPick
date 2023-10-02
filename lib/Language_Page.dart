import 'package:dropdown_button2/dropdown_button2.dart';
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
  final List<String> Item = [
    'English',
    'عربي',
  ];

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
          const SizedBox(height: 30),
            const Text('Select Language',
              style: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: AppColors.themeColor,
                      width: 3,
                    ),
                  ),
                ),
                hint: const Text(
                  'Choose Language',
                  style: TextStyle(fontSize: 14),
                ),
                items: Item.map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select Language';
                  }
                  return null;
                },
                onChanged: (value) {
                  //Do something when selected item is changed.
                },
                // onSaved: (value) {
                //   selectedValue = value.toString();
                // },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
            ),
          ],

      ),
    );
  }
}

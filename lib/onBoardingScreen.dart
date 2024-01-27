import 'package:anypickdemo/NewHomeScreen.dart';
import 'package:anypickdemo/Request_Model.dart';
import 'package:anypickdemo/Widgets/AppColors.dart';
import 'package:anypickdemo/controller/language_change_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'Register.dart';
import 'Widgets/CustomButton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'http_request.dart';

enum Language{ English,Arabic}
class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardscreenState createState() => _OnboardscreenState();
}

class _OnboardscreenState extends State<OnboardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final pages = [
    Container(
      width: double.infinity,
      color: AppColors.whitetext,
      child: Padding(
        padding: const EdgeInsets.only(top:80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'images/mainlogo.png',
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'images/onboarding1.png',
                height: 250,
                width: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Text(
                "Find your desired food around you",
                style: TextStyle(
                  color: AppColors.greyText,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      width: double.infinity,
      color: AppColors.themeColor2,
      child: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5,),
              child: Image.asset(
                'images/whiteicon.png',
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Image.asset(
                'images/onboarding2.png',
                height: 250,
                width: 250,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 90),
              child: Text(
                "Pickup your food on the go",
                style: TextStyle(
                  color: AppColors.whitetext,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    Container(
      color: AppColors.whitetext,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(320,25,0,0),
              child: Consumer<LanguageChangeController>(builder: (context,provider,child){
                return PopupMenuButton(
                    icon: const Icon(Icons.language_rounded),
                    onSelected: (Language item){
                      if(Language.English.name==item.name){
                        provider.changeLanguage(const Locale('en'));
                      } else{
                        provider.changeLanguage(const Locale('ar'));
                      }
                    },
                    itemBuilder: (BuildContext context)=> <PopupMenuEntry<Language>>[
                      const PopupMenuItem(
                          value: Language.English,
                          child: Text("Enlgish")),
                      const PopupMenuItem(
                          value: Language.Arabic,
                          child: Text("العربية")),
                    ]
                );
              })),
          Padding(
            padding: const EdgeInsets.only(bottom: 60,top: 30),
            child: Image.asset(
              "images/mainlogo.png",
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Image.asset(
              "images/image1.png",
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 140 , left: 10 , right: 10),
            child: Text(
              "We are excited, let's get started!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: AppColors.blackColor,
              ),
            ),
          ),

        ],
      ),
    ),
  ];

  int currentPage = 0;
  var cdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: [
              PageView(
                children: pages,
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
              ),
              Positioned(
                bottom: 100,
                left: 30,
                right: 30,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    (currentPage == 2 )
                        ? CustomButton(text: AppLocalizations.of(context)!.continuetext,
                      onPressed: () async {
                        http.Response? response = (await  getPosts()) as http.Response?;
                     //   print(responseData);
                        //  print(responseData['StatusCode']);
           
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                      },) :
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ...List<Widget>.generate(pages.length, (index) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: 10,
                                width: index == currentPage ? 15 : 10,
                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: index == currentPage
                                      ? AppColors.themeColor
                                      : AppColors.greyText,
                                ),
                              );
                            }),
                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ]));
  }

  void continueMethod(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const registerscreen()),
          (Route<dynamic> route) => false,
    );
  }
  Future<void> HomeMethod(BuildContext context) async {
 
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomeScreen()),
            (Route<dynamic> route) => false,
        );
    }
    PageController _pageController = PageController(initialPage: 0);
}

 
    Future<http.Response?> getPosts() async {
       String uuid =  Uuid().v4();
       print(uuid);
        var client = http.Client();
        var uri = Uri.parse('https://1c1d-2407-d000-a-34c9-4d24-935b-1a6a-d4d8.ngrok-free.app/api/user/login?Devicid=$uuid&Roleid=1&Verified=false');
        var response = await client.post(uri);
        if (response.statusCode == 200){
            print(response.body);
            ResponseModel parseJson(jsonString){
              try {
                final Map<String, dynamic>data = jsonDecode(jsonString);
                return ResponseModel.fromJson(data);
              
              }
              catch (e){
                print("Error: $e");
                return ResponseModel();
              }
            }
            ResponseModel responseModel=parseJson(response.body);
            print(responseModel.statusCode);
            print(responseModel.data);
            print('hello');
      
           return response;


        }


    }

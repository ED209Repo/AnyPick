import 'package:anypickdemo/order_placed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'Widgets/AppColors.dart';

class ProcessingScreen extends StatefulWidget {
  @override
  _ProcessingScreenState createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  bool paymentVerified = false;

  @override
  void initState() {
    super.initState();
    // Simulate payment processing for 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        paymentVerified = true;
      });

      // Automatically navigate to the next screen after 4 seconds
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPlacedScreen(),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              paymentVerified
                  ? AppLocalizations.of(context)!.paymentverified
                  : AppLocalizations.of(context)!.yourpaymentisbeingprocessed,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 500), // Animation duration
              child: paymentVerified
                  ? _buildCheckMarkAnimation()
                  : _buildLoader(),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLoader() {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.themeColor2),
    );
  }

  Widget _buildCheckMarkAnimation() {
    // Replace this with your custom check mark animation or use a package like Lottie.
    // Example of using Flutter's built-in Icons to display a check mark.
    return Icon(
      Icons.check_circle,
      color: Colors.green,
      size: 64,
    );
  }
}

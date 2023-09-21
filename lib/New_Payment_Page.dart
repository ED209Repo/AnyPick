import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';
import 'Widgets/AppColors.dart';

class PaymentMethodPage extends StatefulWidget {
  final List<Map<String, String>> paymentMethods;

  PaymentMethodPage({required this.paymentMethods});
  @override
  _PaymentMethodPageState createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  List<Map<String, String>> paymentMethods = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text('Payment Method'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: paymentMethods.length + 1,
                itemBuilder: (context, index) {
                  if (index == paymentMethods.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                        onPressed: () async {
                          final newPaymentMethod = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddCardPage(
                                onCardAdded: (Map<String, String> cardData) {
                                  if (cardData != null) {
                                    setState(() {
                                      paymentMethods.add(cardData);
                                    });
                                  }
                                },
                              ),
                            ),
                          );
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: Color(0xFFF5A896)),
                            SizedBox(width: 8),
                            Text(
                              "Add a new card",
                              style: TextStyle(color: Color(0xFFF5A896)),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    final paymentMethod = paymentMethods[index];
                    return ListTile(
                      leading: const Icon(Icons.credit_card),
                      title: Text(paymentMethod['cardNumber'] ?? ''),
                      subtitle: Text('${paymentMethod['cardHolder']} - ${paymentMethod['expirationDate']}'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardPage extends StatefulWidget {
  final Function(Map<String, String> cardData) onCardAdded;

  const AddCardPage({Key? key, required this.onCardAdded}) : super(key: key);

  @override
  _AddCardPageState createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final TextEditingController holderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController validThruController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColor,
        title: const Text('Add Your Card'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            Form(
              child: Column(
                children: [
                  FMHolderField(
                    controller: holderController,
                    cursorColor: AppColors.themeColor, // Set color here
                    decoration: InputDecoration(
                      labelText: "Card Holder",
                      hintText: "Your Name",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.themeColor,
                          width: 3,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  FMNumberField(
                    controller: cardNumberController,
                    cursorColor: AppColors.themeColor, // Set color here
                    decoration: InputDecoration(
                      labelText: "Card Number",
                      hintText: "0000 0000 0000 0000",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.themeColor,
                          width: 3,
                        ),
                      ),
                      labelStyle: TextStyle(
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FMValidThruField(
                          controller: validThruController,
                          cursorColor: AppColors.themeColor, // Set color here
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.themeColor,
                                width: 3,
                              ),
                            ),
                            labelText: "Valid Thru",
                            hintText: "****",
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: FMCvvField(
                          controller: cvvController,
                          cursorColor: AppColors.themeColor, // Set color here
                          decoration: InputDecoration(
                            labelText: "CVV",
                            hintText: "***",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.themeColor,
                                width: 3,
                              ),
                            ),
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle saving the card data
                  final cardHolder = holderController.text;
                  final cardNumber = cardNumberController.text;
                  final expirationDate = validThruController.text;
                  final cvv = cvvController.text;
                  // Validate and save the card data as needed
                  if (cardHolder.isNotEmpty &&
                  cardNumber.isNotEmpty &&
                  expirationDate.isNotEmpty &&
                  cvv.isNotEmpty) {
                  // Create a new card data instance
                  final cardData = {
                  'cardHolder': cardHolder,
                  'cardNumber': cardNumber,
                  'expirationDate': expirationDate,
                  'cvv': cvv,
                  };
                  widget.onCardAdded(cardData);
                  Navigator.pop(context);
                  } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content: Text('Please fill in all fields.'),
                  duration: Duration(seconds: 2),
                  ),
                  );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.themeColor, // Color change
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  minimumSize: Size(MediaQuery.of(context).size.width * 0.5, 0),
                ),
                child: const Text(
                  'Add Card',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

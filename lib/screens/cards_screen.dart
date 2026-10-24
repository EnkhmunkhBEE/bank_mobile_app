import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const UserCard(),
    );
  }
}

class UserCard extends StatefulWidget {
  const UserCard({super.key});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  // Mock data
  final String cardNumber = '4821 5530 9017 2264';
  final String expiryDate = '12/28';
  final String cardHolderName = 'MOKUU';
  final String cvvCode = '123';

  bool isCvvFocused = false; // true shows the back of the card

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        // tap the card to flip it
        onTap: () => setState(() => isCvvFocused = !isCvvFocused),
        child: CreditCardWidget(
          cardNumber: cardNumber,
          expiryDate: expiryDate,
          cardHolderName: cardHolderName,
          cvvCode: cvvCode,
          showBackView: isCvvFocused,
          cardBgColor: const Color(0xFF1A56DB),
          bankName: 'Mokuu Bank',
          onCreditCardWidgetChange: (CreditCardBrand brand) {},
        ),
      ),
    );
  }
}

class Utils extends StatefulWidget {
  const new({super.key});

  @override
  State<Utils> createState() => _UtilsState();
}

class _UtilsState extends State<Utils> {
  @override
  Widget build(BuildContext context) {
    return Row();
  }
}

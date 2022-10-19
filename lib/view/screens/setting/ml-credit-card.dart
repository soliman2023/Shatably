
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:card_scanner/card_scanner.dart';
import 'package:get/get.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';



class MlCreditCard extends StatefulWidget {
  @override
  _MlCreditCard createState() => _MlCreditCard();
}

class _MlCreditCard extends State<MlCreditCard> {
  CardDetails? _cardDetails;
  CardScanOptions scanOptions =const  CardScanOptions(
      scanCardHolderName: true,
      //enableDebugLogs: true,
      validCardsToScanBeforeFinishingScan: 5,
      possibleCardHolderNamePositions: [
        CardHolderNameScanPosition.aboveCardNumber,
      ],
      scanExpiryDate: true,
      maxCardHolderNameLength: 26

  );

  Future<void> scanCard() async {
    var cardDetails = await CardScanner.scanCard(scanOptions: scanOptions);
    if (!mounted) return;
    setState(() {
      _cardDetails = cardDetails;
    });
  }

  @override
  Widget build(BuildContext context) {
    var color=context.theme.backgroundColor;
    return Scaffold(
      backgroundColor: Get.isDarkMode?darkGreyClr:Colors.white,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Get.isDarkMode?pinkClr:mainColor,
        title: TextUtils(
          fontSize: 20,
          color: Colors.white,
          text: 'Scan Credit Card',
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CreateGenButtons(
                onTap: ()async{
                  scanCard();
                },
                text: 'scan card',
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  width: 1
                )
              ),
                child: Text('$_cardDetails',
                style: TextStyle(
                  color: Get.isDarkMode?Colors.white:Colors.black,
                  fontSize: 25
                ),)),
          ],
        ),
      ),
    );
  }
}

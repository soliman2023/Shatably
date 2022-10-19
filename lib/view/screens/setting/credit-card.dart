import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:graduation_project/routes/routes.dart';
import 'package:graduation_project/units/theme.dart';
import 'package:graduation_project/view/widgets/more/buttons.dart';
import 'package:graduation_project/view/widgets/text_utils.dart';

import 'ml-credit-card.dart';


class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key}) : super(key: key);

  @override
  _CreditCardPageState createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  String cardNumber = '';
  String expiryDate= '';
  String cardHolderName = '';
  String cvvCode= '';
  bool isCvvFocused = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
          text: 'CreditCard',
          fontWeight: FontWeight.bold,
          underLine: TextDecoration.none,
        ),
        actions: [
          IconButton(onPressed: ()=>Get.toNamed(Routes.mlCreditCardScreen),
              icon: Icon(Icons.credit_card))
        ],
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          children: [
            CreditCardWidget(
              cardBgColor: Get.isDarkMode?pinkClr:mainColor,
              cardType: CardType.mastercard,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CreditCardForm(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                        onCreditCardModelChange: onCreditCardModelChange,
                        themeColor: Colors.white,
                        formKey: formKey,
                        cardNumberDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Number',
                            hintText: 'xxxx xxxx xxxx xxxx',
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                        expiryDateDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Expired Date',
                            hintText: 'xx/xx',
                          filled: true,
                          fillColor:Colors.grey.shade300,
                        ),
                        cvvCodeDecoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'CVV',
                            hintText: 'xxx',
                          filled: true,
                          fillColor: Colors.grey.shade300,
                        ),
                        cardHolderDecoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Card Holder',
                          filled: true,
                          fillColor:Colors.grey.shade300,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CreateGenButtons(
                          onTap: (){
                            if(formKey.currentState!.validate()){
                              print('valid');
                            }
                          },
                          text: 'validate'.tr,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel){
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
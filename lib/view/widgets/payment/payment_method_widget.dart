
import 'package:flutter/material.dart';
import 'package:graduation_project/units/theme.dart';
import '../text_utils.dart';


class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  _PayMentMethodWidgetState createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {

  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          buildRadioPayment(
            name: "Paypal",
            image: 'assets/image/paypal.png',
            scale: 0.7,
            value: 1,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });

            },
          ),
          const SizedBox(
            height: 15,
          ),
            buildRadioPayment(
            name: "Google Pay",
    image: 'assets/image/google.png',
    scale: 0.8,
    value: 2,
    onChange: (int? value) {
    setState(() {
    radioPaymentIndex = value!;
    });
    }),
          const SizedBox(
            height: 15,
          ),
          buildRadioPayment(
            name: "Credit Card",
            image: 'assets/image/credit.png',
            scale: 0.7,
            value: 3,
            onChange: (int? value) {
              setState(() {
                radioPaymentIndex = value!;
              });
              //payMentController.removeGooglePay();
            },
          )
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                image,
                scale: scale,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}

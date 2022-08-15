import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outlined,
              size: 200,
              color: kBlueColor,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Thank You for Your Order',
              style: purpletextStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Your order will be processed, \nPlease wait',
              textAlign: TextAlign.center,
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                int count = 0;
                Navigator.of(context).popUntil((_) => count++ >= 2);
              },
              child: Container(
                margin: EdgeInsets.all(defaultMargin),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(defaultBorder),
                ),
                child: Center(
                  child: Text(
                    'Order Another',
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

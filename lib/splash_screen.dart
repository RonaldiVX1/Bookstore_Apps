import 'package:actionfigure_app/main.dart';
import 'package:actionfigure_app/services/product_provider.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  String username;
  SplashScreen({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kbgColor,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 700,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/splash_book.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      height: 100,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(defaultBorder),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Welcome, $username',
                        textAlign: TextAlign.center,
                        style: redtextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'We are forever invested in you and want to make your shopping experience with us a memorable, enjoyable and easy one.',
                        textAlign: TextAlign.center,
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyStatefulWidget(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.all(defaultMargin),
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          color: kPurpleColor,
                          borderRadius: BorderRadius.circular(defaultBorder),
                        ),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: kWhiteColor,
                            )
                          ],
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:actionfigure_app/splash_screen.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'auth/auth.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController usernameFieldController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  Widget header() {
    return Column(
      children: [
        Text(
          'Sign Up',
          style: purpletextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Create your Account',
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }

  Widget boxSignUp() {
    return Container(
      margin: EdgeInsets.all(defaultMargin),
      padding: EdgeInsets.all(defaultMargin),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(defaultBorder),
        color: kPurpleColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            style: whiteTextStyle,
            controller: textFieldController,
            decoration: InputDecoration(
              fillColor: kWhiteColor.withOpacity(0.1),
              filled: true,
              hintText: 'Your Email',
              hintStyle: whiteTextStyle,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Username',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            style: whiteTextStyle,
            controller: usernameFieldController,
            decoration: InputDecoration(
              fillColor: kWhiteColor.withOpacity(0.1),
              filled: true,
              hintText: 'Your Username',
              hintStyle: whiteTextStyle,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            'Password',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            style: whiteTextStyle,
            controller: passwordFieldController,
            obscureText: true,
            decoration: InputDecoration(
              fillColor: kWhiteColor.withOpacity(0.1),
              filled: true,
              hintText: 'Your Password',
              hintStyle: whiteTextStyle,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 50),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                header(),
                boxSignUp(),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () async {
                    await Authentication.registerWithEmailAndPassword(
                        usernameFieldController.text,
                        passwordFieldController.text,
                        textFieldController.text);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplashScreen(
                              username: usernameFieldController.text)),
                    );
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
                        'Log In',
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
          )
        ],
      ),
    );
  }
}

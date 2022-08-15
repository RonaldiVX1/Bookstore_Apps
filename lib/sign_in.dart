import 'package:actionfigure_app/auth/auth.dart';
import 'package:actionfigure_app/auth/user_service.dart';
import 'package:actionfigure_app/home.dart';
import 'package:actionfigure_app/main.dart';
import 'package:actionfigure_app/dummy_data.dart';
import 'package:actionfigure_app/signup_page.dart';
import 'package:actionfigure_app/splash_screen.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'services/product_provider.dart';

class SignIn extends StatelessWidget {
  List dataLogin = DummyData.data;

  TextEditingController textFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  void getLocalData(BuildContext context) async {
    SharedPreferences getData = await SharedPreferences.getInstance();
    String? Username = getData.getString('nama');
    print(Username);
    if (Username != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashScreen(username: Username),
        ),
      );
    }
  }

  void deleteLocalData() async {
    SharedPreferences deleteData = await SharedPreferences.getInstance();
    deleteData.remove('nama');
  }

  final snackBar = SnackBar(
    content: Text(
      'Please fill in the box!',
      style: whiteTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.red,
  );

  final snackBarWrongInput = SnackBar(
    content: Text(
      'Username or Password Maybe Wrong',
      style: whiteTextStyle.copyWith(
        fontWeight: FontWeight.bold,
      ),
    ),
    backgroundColor: Colors.red,
  );

  SignIn({Key? key}) : super(key: key);

  Widget header() {
    return Column(
      children: [
        Text(
          'Log in',
          style: purpletextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Log in to Continue',
          style: greyTextStyle.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
        )
      ],
    );
  }

  Widget boxLogin() {
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
            controller: textFieldController,
            decoration: InputDecoration(
              fillColor: kWhiteColor.withOpacity(0.1),
              filled: true,
              hintText: 'Your Username',
              hintStyle: whiteTextStyle,
            ),
          ),
          SizedBox(
            height: 30,
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

  Widget build(BuildContext context) {
    getLocalData(context);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 50),
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                header(),
                boxLogin(),
                FutureBuilder(
                  future: Authentication.initializeFirebase(context: context),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error initializing Firebase');
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      return GoogleSignInButton();
                    }
                    return CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  },
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        textStyle: purpletextStyle.copyWith(fontSize: 16)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text("Create Your Account")),
                GestureDetector(
                  onTap: () {
                    checkLogin(context);
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
          ),
        ],
      ),
    );
  }

  void _sendUsername(BuildContext context) {
    String username = textFieldController.text;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SplashScreen(
          username: username,
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    SharedPreferences saveNama = await SharedPreferences.getInstance();

    if (textFieldController.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (textFieldController.text != null) {
      await Authentication.SignInFirebase(
          textFieldController.text, passwordFieldController.text);

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SplashScreen(username: user.displayName ?? "undefined ")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarWrongInput);
      }

      // for (var i = 0; i < dataLogin.length; i++) {
      //   if (textFieldController.text == dataLogin.elementAt(i)['username'] &&
      //       passwordFieldController.text ==
      //           dataLogin.elementAt(i)['password']) {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => SplashScreen(
      //           username: dataLogin.elementAt(i)['nama'],
      //         ),
      //       ),
      //     );
      //     saveNama.setString('nama', dataLogin.elementAt(i)['nama']);
      //     break;
      //   } else if ((textFieldController.text ==
      //               dataLogin.elementAt(i)['username'] &&
      //           passwordFieldController.text !=
      //               dataLogin.elementAt(i)['password']) ||
      //       (textFieldController.text != dataLogin.elementAt(i)['username'] &&
      //           passwordFieldController.text ==
      //               dataLogin.elementAt(i)['password'])) {
      //     ScaffoldMessenger.of(context).showSnackBar(snackBarWrongInput);
      //     break;
      //   }
      // }
    }
  }
}

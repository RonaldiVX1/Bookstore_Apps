import 'package:actionfigure_app/sign_in.dart';
import 'package:actionfigure_app/splash_screen.dart';
import 'package:actionfigure_app/ui/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/auth.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isSigningOut = false;

  Future<String> getUsername() async {
    User? user = await Authentication.signInWithGoogle(context: context);
    SharedPreferences getUsername = await SharedPreferences.getInstance();
    setState(() {
      username = getUsername.getString('nama');
    });
    return getUsername.getString('nama') ?? '';
  }

  Future<bool> deleteUsername() async {
    SharedPreferences deleteUsername = await SharedPreferences.getInstance();
    return deleteUsername.remove('nama');
  }

  void initState() {
    super.initState();
    // getUsername().then((nama) => username = nama);
  }

  String? username = FirebaseAuth.instance.currentUser?.displayName;

  @override
  Widget build(BuildContext context) {
    Widget profileImage() {
      return Container(
        height: 150,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/about.png'),
          ),
        ),
      );
    }

    Widget TextUsername() {
      return Container(
        padding: EdgeInsets.all(10),
        child: Text(
          '$username',
          textAlign: TextAlign.center,
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    Widget optionMenu() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultBorder),
          color: kPurpleColor,
        ),
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Account",
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor.withOpacity(0.5),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Privacy & Policy",
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor.withOpacity(0.5),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FAQ",
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor.withOpacity(0.5),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(5),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rate App",
                    style: whiteTextStyle.copyWith(
                        fontWeight: FontWeight.normal, fontSize: 18),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kWhiteColor.withOpacity(0.5),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Route _routeToSignInScreen() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => SignIn(),
      );
    }

    Widget logOutButton() {
      return GestureDetector(
        onTap: () async {
          Authentication.signOutFirebase();
          setState(() {
            _isSigningOut = true;
          });
          await Authentication.signOut(context: context);
          setState(() {
            _isSigningOut = false;
          });
          Navigator.of(context).pushReplacement(_routeToSignInScreen());
          // deleteUsername();
          // Navigator.popUntil(context, (route) => route.isFirst);
        },
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kRedColor,
            borderRadius: BorderRadius.circular(defaultBorder),
          ),
          child: Center(
            child: Text(
              'Log Out',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            profileImage(),
            SizedBox(
              height: 30,
            ),
            TextUsername(),
            optionMenu(),
            logOutButton(),
          ],
        ),
      ],
    );
  }
}

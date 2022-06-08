import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Screens/Login/login_screen.dart';
import '../../Screens/Signup/signup_screen.dart';
import '../../components/background.dart';
import '../../constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME TO EDU",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: defaultPadding * 2),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 8,
                    child: SvgPicture.asset(
                      "assets/icons/chat.svg",
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: defaultPadding * 2),
              Row(
                children: [
                  Spacer(),
                  Expanded(
                    flex: 8,
                    child: Column(
                      children: [
                        Hero(
                          tag: "login_btn",
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return LoginScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Login".toUpperCase(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return SignUpScreen();
                                },
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kPrimaryLightColor, elevation: 0),
                          child: Text(
                            "Sign Up".toUpperCase(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

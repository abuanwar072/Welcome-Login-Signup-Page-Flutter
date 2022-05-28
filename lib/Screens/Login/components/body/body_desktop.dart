import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_auth/responsive/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BodyDesktop extends StatelessWidget {
  const BodyDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: Responsive.isDesktop(context) ? 2 : 1,
            child: SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.45,
            ),
          ),
          SizedBox(
            width: size.height * 0.1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "LOGIN",
                  press: () {},
                  height: size.height * 0.07,
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SignUpScreen();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

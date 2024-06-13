import 'package:chit_chat/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/features/auth/screens/login_screen.dart';

import '../../../common/utils/colors.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height / 50),
              Image.asset(
                'assets/bg.png',
                height: 340,
                width: 340,
                color: tabColor,
              ),

              SizedBox(height: size.height / 20),
              const Text(
                "Welcome to ChitChat",
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
              //SizedBox(height: size.height / 9),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Read our Privacy Policy. Tap "Agree and continue" to accept the Terms of Service.',
                  style: TextStyle(
                    color: greyColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: size.height / 4),
              SizedBox(
                width: size.width * 01,
                child: CustomButton(
                  text: 'Agree and continue',
                  onPressed: () => navigateToLoginScreen(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

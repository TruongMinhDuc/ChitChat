import 'package:chit_chat/colors.dart';
import 'package:chit_chat/common/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
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
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                onPressed: () {},
                text: 'Agree and continue',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

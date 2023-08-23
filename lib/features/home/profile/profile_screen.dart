import 'package:flutter/material.dart';
import 'package:trauxit_task/core/router.dart';
import 'package:trauxit_task/core/widgets/main_textbutton.dart';
import 'package:trauxit_task/features/auth/login_screen.dart';

import 'widgets/profile_info.dart';
import 'widgets/social_media.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            const ProfileInfo(),
            const SizedBox(height: 20),
            const SocialMediaList(),
            MainTextButton(
              onPressed: () => RouterNavigator.navigateAndPopAll(
                const LoginScreen(),
              ),
              title: 'Logout',
              buttonLook: ButtonLook.text,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

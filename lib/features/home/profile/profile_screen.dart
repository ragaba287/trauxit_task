import 'package:flutter/material.dart';

import 'widgets/profile_info.dart';
import 'widgets/social_media.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProfileInfo(),
            SizedBox(height: 20),
            SocialMediaList(),
          ],
        ),
      ),
    );
  }
}

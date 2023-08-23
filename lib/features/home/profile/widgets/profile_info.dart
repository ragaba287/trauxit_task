import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/funs.dart';
import 'profile_info_item.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Text(
                'Ahmed Ragab',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'ragaba267@gmail.com',
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileInfoItem(
                    onTap: () async => lanchUrl('tel://+201026612529'),
                  ),
                  ProfileInfoItem(
                    onTap: () => lanchUrl(
                      'mailto:ragaba267@gmail.com?subject=Inquiry about TRAUXIT Task',
                    ),
                    icon: IonIcons.mail,
                  ),
                  ProfileInfoItem(
                    onTap: () => lanchUrl(
                      'whatsapp://send?phone=+201026612529&text=Inquiry about TRAUXIT Task',
                    ),
                    icon: Iconsax.whatsapp,
                  ),
                ],
              ),
            ],
          ),
        ),
        const ProfilePicrure(),
      ],
    );
  }
}

class ProfilePicrure extends StatelessWidget {
  const ProfilePicrure({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -60,
      right: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 4),
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              'https://avatars.githubusercontent.com/u/37620588?v=4',
              fit: BoxFit.scaleDown,
              scale: 1,
            ),
          ),
        ),
      ),
    );
  }
}

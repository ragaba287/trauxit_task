import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import 'social_media_item.dart';

class SocialMediaList extends StatelessWidget {
  const SocialMediaList({super.key});

  @override
  Widget build(BuildContext context) {
    List socialMedia = [
      {
        "icon": Bootstrap.github,
        "title": "github.com/ragaba287",
        "url": "https://github.com/ragaba287",
      },
      {
        "icon": Bootstrap.linkedin,
        "title": "linkedin.com/in/ragaba267",
        "url": "https://www.linkedin.com/in/ragaba267/",
      },
      {
        "icon": Bootstrap.facebook,
        "title": "fb.com/ragaba287",
        "url": "https://fb.com/ragaba287",
      },
    ];

    return ListView.separated(
      itemCount: socialMedia.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SocialMediaItem(
        item: socialMedia[index],
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

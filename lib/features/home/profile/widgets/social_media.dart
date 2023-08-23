import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/funs.dart';

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
      itemBuilder: (context, index) {
        return SocialMediaItem(item: socialMedia[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class SocialMediaItem extends StatelessWidget {
  const SocialMediaItem({super.key, this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(5),
      onTap: () => lanchUrl(item['url']),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary.withOpacity(.02),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              item['icon'],
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 20),
            Text(
              item['title'],
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            Icon(
              Iconsax.link,
              color: theme.colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../core/funs.dart';

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
            Icon(item['icon'], color: theme.colorScheme.primary),
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
            Icon(Iconsax.link, color: theme.colorScheme.primary),
          ],
        ),
      ),
    );
  }
}

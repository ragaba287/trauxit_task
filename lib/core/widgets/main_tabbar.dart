import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MainTabbar extends StatelessWidget {
  const MainTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return TabBar(
      indicatorColor: theme.colorScheme.primary,
      tabs: const [
        Tab(
          text: 'Posts',
          icon: Icon(BoxIcons.bxs_news),
        ),
        Tab(
          text: 'Weather',
          icon: Icon(Iconsax.cloud),
        ),
      ],
    );
  }
}

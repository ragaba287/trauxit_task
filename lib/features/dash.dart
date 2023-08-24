import 'package:flutter/material.dart';

import '../core/widgets/main_tabbar.dart';
import 'posts/post_screen.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trauxit Task'),
          bottom: const PreferredSize(
              preferredSize: Size(0, 60), child: MainTabbar()),
        ),
        body: const TabBarView(
          children: [PostsScreen(), PostsScreen()],
        ),
      ),
    );
  }
}

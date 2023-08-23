import 'package:flutter/material.dart';

import '../../../core/widgets/image_fadder.dart';
import '../../../core/widgets/main_textbutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const ImageFadder(
            image:
                'https://trauxit.com/wp-content/uploads/2023/08/TRAUXIT-2.png',
            height: 150,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 50),
          const Text(
            'Welecome To TRAUXIT Task',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
          ),
          const SizedBox(height: 10),
          Text(
            'Feel Free to browse, test the app or contact me for any inquiry.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.primary.withOpacity(.5),
            ),
          ),
          const SizedBox(height: 25),
          MainTextButton(
            onPressed: () => DefaultTabController.of(context).animateTo(1),
            title: 'Contact Me',
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}

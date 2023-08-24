import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../models/post_model.dart';

class PostItem extends StatelessWidget {
  const PostItem({super.key, required this.postModel});
  final PostModel postModel;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: theme.cardTheme.color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(BoxIcons.bxs_news, size: 30),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  postModel.title ?? 'Title',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 30),
          Text(
            postModel.body ?? 'Body',
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

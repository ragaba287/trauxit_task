import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostShimmer extends StatelessWidget {
  const PostShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10.0,
      height: 200,
      child: Shimmer.fromColors(
        baseColor: const Color(0x103a3a3a),
        highlightColor: const Color(0x303a3a3a),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

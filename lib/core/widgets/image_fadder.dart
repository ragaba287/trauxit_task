import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../res/res_images.dart';

class ImageFadder extends StatelessWidget {
  const ImageFadder({
    super.key,
    required this.image,
    this.height = 100,
    this.width = 350,
    this.scale = 20,
    this.fit = BoxFit.cover,
  });

  final String image;
  final double height;
  final double width;
  final double scale;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height == 0 ? null : height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Image.asset(
            ResImages.logo,
            fit: BoxFit.scaleDown,
            scale: scale,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: height,
        width: width,
        child: const Center(child: Icon(Icons.error)),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultNetworkImage extends StatelessWidget {
  const DefaultNetworkImage({
    required this.imagePath,
    super.key,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.radius = 4,
  });

  final String imagePath;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
      placeholder: (context, url) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}

// profile image
class ProfileCircle extends StatelessWidget {
  const ProfileCircle({
    super.key,
    this.imagePath,
    this.size = 100,
  });

  final String? imagePath;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: ClipOval(
        child: imagePath != null && imagePath != ''
            ? DefaultNetworkImage(
                imagePath: imagePath ?? '',
              )
            : Image.asset(
                'assets/images/profile_null_.png',
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class ImagePosted extends StatelessWidget {
  const ImagePosted({
    super.key,
    this.imagePath,
  });

  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return imagePath != ''
        ? Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: DefaultNetworkImage(
              imagePath: imagePath!,
              fit: BoxFit.cover,
              radius: 0,
            ),
          )
        : Container();
  }
}

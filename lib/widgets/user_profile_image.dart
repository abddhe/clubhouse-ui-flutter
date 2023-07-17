import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final double size;
  final String imageURL;

  const UserProfileImage(
      {super.key, required this.size, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size / 2 - size / 6.67),
      child: Image.network(
        imageURL,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}

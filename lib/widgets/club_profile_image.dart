import "package:clubhouse_ui/models/user.dart";
import "package:clubhouse_ui/widgets/user_profile_image.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";

class ClubProfileImage extends StatelessWidget {
  final User user;
  final double size;
  final bool isNew;
  final bool isMuted;

  const ClubProfileImage({
    super.key,
    required this.user,
    required this.size,
    this.isNew = false,
    this.isMuted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: UserProfileImage(
                size: size,
                imageURL: user.imageURL,
              ),
            ),
            if (isNew)
              Positioned(
                left: 5,
                bottom: 5.0,
                child: Container(
                  padding: EdgeInsets.all(size / 20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    color: Colors.green,
                    CupertinoIcons.star_fill,
                    size: size / 6.67,
                  ),
                ),
              ),
            if (isMuted)
              Positioned(
                right: 5.0,
                bottom: 5.0,
                child: Container(
                  padding: EdgeInsets.all(size / 20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    color: Colors.grey,
                    CupertinoIcons.mic_slash_fill,
                    size: size / 6.67,
                  ),
                ),
              ),
          ],
        ),
        Flexible(
          child: Text(
            user.firstName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

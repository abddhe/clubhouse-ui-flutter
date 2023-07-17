import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/screens/room_screen.dart';
import 'package:clubhouse_ui/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_)=> RoomScreen(room: room),
          fullscreenDialog: true,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: "${room.club} "),
                      WidgetSpan(
                        child: Icon(
                          Icons.home_rounded,
                          size: 18.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  room.name,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      ),
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 27.0,
                              top: 35.0,
                              child: UserProfileImage(
                                  size: 55,
                                  imageURL: room.speakers[0].imageURL),
                            ),
                            UserProfileImage(
                                size: 55, imageURL: room.speakers[1].imageURL),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...room.speakers
                              .getRange(0, 2)
                              .toList()
                              .map((e) => Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      '${e.firstName} ${e.lastName} 💬',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w900),
                                    ),
                                  )),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text.rich(
                            TextSpan(
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 15.0),
                              children: [
                                TextSpan(
                                    text:
                                        "${room.speakers.length + room.followedBySpeakers.length + room.others.length} "),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.person_fill,
                                    size: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                                const TextSpan(
                                    text: " / ",
                                    style: TextStyle(fontSize: 12.0)),
                                TextSpan(text: " ${room.speakers.length} "),
                                const WidgetSpan(
                                  child: Icon(
                                    CupertinoIcons.chat_bubble_fill,
                                    size: 16.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

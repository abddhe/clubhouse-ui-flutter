import 'dart:math';

import 'package:clubhouse_ui/models/room.dart';
import 'package:clubhouse_ui/test_data.dart';
import 'package:clubhouse_ui/widgets/club_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/user_profile_image.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            textStyle:
                const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            CupertinoIcons.chevron_down,
            size: 22.0,
          ),
          label: const Text("Hallway"),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.doc,
              size: 28.0,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
              child: UserProfileImage(size: 40, imageURL: currentUser.imageURL),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 35.0,
                vertical: 20.0,
              ),
              height: MediaQuery.sizeOf(context).height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(text: "${room.club} "),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.home_rounded,
                                      size: 18.0,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                  ),
                                ],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ),
                            const Icon(CupertinoIcons.ellipsis),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          room.name,
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 3,
                    children: [
                      ...room.speakers.map(
                        (e) => ClubProfileImage(
                          user: e,
                          size: 70.0,
                          isNew: Random.secure().nextBool(),
                          isMuted: Random.secure().nextBool(),
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 10.0),
                      child: Text(
                        "Followed by Speakers",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 4,
                    childAspectRatio: .9,
                    children: [
                      ...room.followedBySpeakers.map(
                        (e) => ClubProfileImage(
                          user: e,
                          size: 60.0,
                          isNew: Random.secure().nextBool(),
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 10.0, 0, 10.0),
                      child: Text(
                        "Others in the room",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SliverGrid.count(
                    crossAxisCount: 4,
                    childAspectRatio: .9,
                    children: [
                      ...room.others.map(
                        (e) => ClubProfileImage(
                          user: e,
                          size: 60.0,
                          isNew: Random.secure().nextBool(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                color: Theme.of(context).primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 3.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                  text: '✌🏼 ',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                  )),
                              TextSpan(
                                text: "Leave quietly",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.add,
                              size: 27.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.hand_raised,
                              size: 27.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

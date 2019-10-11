import 'package:flutter/material.dart';
import 'package:flutter_movie_plus/widgets/animated_bottom_app_bar.dart';

import 'movie.dart';

final recentMovies = <Movie>[
  Movie(
      title: 'Joker',
      imageUrl:
          'http://t2.gstatic.com/images?q=tbn:ANd9GcT-WfZMK-tn-HX6fuLy4RS1BVjkkJoCzUnxyYenGzAbKDSscRz5'),
];

final bottomAppBarItems = <BottomItem>[
  BottomItem(
    title: 'Feed',
    iconData: Icons.home,
    color: Colors.lightGreen,
  ),
  BottomItem(
    title: 'Bookmarks',
    iconData: Icons.bookmark_border,
    color: Colors.red,
  ),
  BottomItem(
    title: 'Profile',
    iconData: Icons.face,
    color: Colors.orangeAccent,
  ),
];

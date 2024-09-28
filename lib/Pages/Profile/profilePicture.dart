// widgets/profile_picture.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:provider/provider.dart';

import '../../Provider/user_provider.dart';
import '../../Utils/profile_color.dart';


class ProfilePicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.yellow, Colors.purple];

    if (user == null) return Container(); // Return empty if user data is not loaded

    final Color backgroundColor = UserColorUtil.getUserColor(user.name, colors);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 90,
          backgroundImage: user.logo != null
              ? NetworkImage(user.logo!)
              : null,
          backgroundColor: user.logo == null ? backgroundColor : null,
          child: user.logo == null
              ? Text(
            user.name[0].toUpperCase(),
            style: const TextStyle(fontSize: 65, color: Colors.white),
          )
              : null,
        ),
        Positioned(
          bottom: 5,
          right: 7,
          child: InkWell(
            onTap: () {
              // Handle image picking
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.purpleAccent, Colors.blue],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(48),
              ),
              child: const Icon(Icons.camera_alt_outlined, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}




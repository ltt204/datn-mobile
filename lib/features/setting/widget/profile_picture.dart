import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  // Mock URL for demonstration purposes
  final String imageUrl =
      "https://claritycareconsulting.co.uk/wp-content/uploads/et_temp/Blank-Profile-Picture-34126_1080x675.jpg";
  final double size;

  const ProfilePicture({
    super.key,
    // required this.imageUrl,
    this.size = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size / 2,
      backgroundImage: NetworkImage(imageUrl),
      backgroundColor: Colors.grey[200],
    );
  }
}

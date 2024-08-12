import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImageGeneration extends StatelessWidget {
  final String userId;
  const ProfileImageGeneration({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.85,
      height: 70.85,
      margin: const EdgeInsets.only(right: 16.15),
      child: Stack(
        // alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/profile-border.svg",
            height: 70.85,
            width: 70.85,
          ),
          Positioned(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.network(
                    'https://api.dicebear.com/8.x/adventurer/png?seed=$userId',
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // Image has loaded, display it
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null, // Show a circular progress indicator while loading
                          ),
                        );
                      }
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.error, color: Colors.red);
                    },
                    width: 50,
                    height: 50,
                  ))),
        ],
      ),
    );
  }
}

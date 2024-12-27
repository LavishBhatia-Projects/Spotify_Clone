import 'package:flutter/material.dart';
import 'package:spotify_clone/audioplayerpage.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';

class MusicContainers extends StatelessWidget {
  final String title;
  final String artist;
  final String imagePath;
  final String musicPath;

  const MusicContainers({
    super.key,
    required this.title,
    required this.artist,
    required this.imagePath,
    required this.musicPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to AudioPlayerPage on tap
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Audioplayerpage(
                  musicPath: musicPath,
                  title: title,
                  artist: artist,
                  imagePath: imagePath)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ThemeCubit().state == ThemeMode.dark
              ? Colors.grey[900]
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image Container
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imagePath, // Use the provided image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16), // Spacing between image and text
            // Title Text
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeCubit().state == ThemeMode.dark
                    ? Colors.white
                    : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8), // Spacing between title and artist
            // Artist Text
            Text(
              artist,
              style: TextStyle(
                fontSize: 16,
                color: ThemeCubit().state == ThemeMode.dark
                    ? Colors.white70
                    : Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

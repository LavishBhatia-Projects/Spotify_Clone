import 'package:flutter/material.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/pages/choosemode/choosemode.dart';
import 'package:spotify_clone/presentation/widgets/button/basicbutton.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/intro_bg - Copy.jpg'),
                fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Center(
            child: Container(
              constraints: BoxConstraints(
                maxWidth: screenSize.width < 500
                    ? screenSize.width
                    : 500, // Limit width for mobile view
                maxHeight: screenSize.height < 800
                    ? screenSize.height
                    : 800, // Limit height for mobile view
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the content vertically
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 50), // Adjust margin for better spacing
                      child: Image.asset(
                        'images/spotify_logo-removebg-preview.png',
                        height: 90,
                        width: 250, // Adjust width to maintain aspect ratio
                        fit: BoxFit
                            .contain, // Maintain aspect ratio for the logo
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                  const SizedBox(height: 21),
                  Container(
                    padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                    child: const Text(
                      'Discover a world of music at your fingertips! Explore your favorite tracks, create custom playlists, and enjoy seamless streaming, all in one place. Your perfect music companion awaits!',
                      textAlign: TextAlign.center, // Center the text
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey,
                        fontSize: 10,
                        fontFamily: 'Satoshi',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: BasicAppbutton(
                      title: 'Get Started',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChooseMode(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

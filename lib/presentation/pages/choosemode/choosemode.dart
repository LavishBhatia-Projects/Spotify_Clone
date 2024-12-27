import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/presentation/pages/SignInSignUp/signinorsignup.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';
import 'package:spotify_clone/presentation/widgets/button/basicbutton.dart';

class ChooseMode extends StatelessWidget {
  const ChooseMode({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the dimensions of the screen
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/choose_mode_bg - Copy.png'),
                fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
              ),
            ),
          ),
          // Overlay Color
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Center(
            // Center the content vertically and horizontally
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
                  // Spotify Logo
                  Container(
                    margin: const EdgeInsets.only(
                        bottom: 30), // Adjusted margin for spacing
                    child: Image.asset(
                      'images/spotify_logo-removebg-preview.png',
                      height: 90,
                      width: 250, // Adjust width to maintain aspect ratio
                      fit: BoxFit.contain, // Maintain aspect ratio for the logo
                    ),
                  ),
                  // Text
                  const Text(
                    'Choose Your Mode',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                  const SizedBox(height: 21),
                  // First Circular Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<ThemeCubit>()
                                  .updateTheme(ThemeMode.dark);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Dark Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Satoshi',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 50),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              context
                                  .read<ThemeCubit>()
                                  .updateTheme(ThemeMode.light);
                            },
                            child: ClipOval(
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xff30393C)
                                        .withOpacity(0.5),
                                  ),
                                  child: Image.asset('images/sun.jpg'),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Light Mode',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Satoshi',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Get Started Button
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: BasicAppbutton(
                      title: 'Continue',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signinorsignup(),
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

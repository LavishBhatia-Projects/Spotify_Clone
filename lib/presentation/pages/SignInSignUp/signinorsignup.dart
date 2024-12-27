import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/pages/SignInSignUp/Signup.dart';
import 'package:spotify_clone/presentation/pages/SignInSignUp/signin.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';
import 'package:spotify_clone/presentation/widgets/button/backbutton.dart';
import 'package:spotify_clone/presentation/widgets/button/basicbutton.dart';

class Signinorsignup extends StatelessWidget {
  const Signinorsignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppbar(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              'images/auth_bg - Copy.png',
              fit: BoxFit.cover, // Use BoxFit.cover to maintain aspect ratio
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/spotify_logo-removebg-preview.png',
                    width: 280, // Set a fixed width for the logo
                    fit: BoxFit.contain, // Maintain aspect ratio for the logo
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Enjoy listening to music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Satoshi',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Listen to your favourite music and explore new music with your friends only on Spotify',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      fontSize: 18,
                      fontFamily: 'Satoshi',
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20),
                        width: 210,
                        child: BasicAppbutton(
                          title: 'Register',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signin(),
                              ),
                            );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: ThemeCubit().state == ThemeMode.dark
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 18,
                              fontFamily: 'Satoshi',
                            ),
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
    );
  }
}

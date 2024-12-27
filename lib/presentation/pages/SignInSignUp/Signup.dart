import 'package:flutter/material.dart';
import 'package:spotify_clone/core/usecase/auth/signupUsecase.dart';
import 'package:spotify_clone/data/models/auth/createuserreq.dart';
import 'package:spotify_clone/presentation/pages/SignInSignUp/signin.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';
import 'package:spotify_clone/presentation/widgets/button/backbutton.dart';
import 'package:spotify_clone/presentation/widgets/button/basicbutton.dart';
import 'package:spotify_clone/servicelocator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppbar(
        title: Image.asset(
          'images/spotify_logo-removebg-preview.png',
          height: 40,
          width: 250,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(child: RegisterText()),
          const SizedBox(height: 25),
          ttextfields(
            context,
            'Username',
            _fullname, // Controller for Username
          ),
          const SizedBox(height: 25),
          ttextfields(
            context,
            'Email',
            _email, // Controller for Email
          ),
          const SizedBox(height: 25),
          ttextfields(
            context,
            'Password',
            _password, // Controller for Password
          ),
          const SizedBox(height: 25),
          Container(
            width: 350,
            height: 50,
            child: BasicAppbutton(
              title: 'Create Account',
              onPressed: () async {
                final fullname = _fullname.text.trim();
                final email = _email.text.trim();
                final password = _password.text.trim();

                if (fullname.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.error_outline, color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text('All fields are required!',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.redAccent,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 3),
                    ),
                  );
                  return;
                }

                try {
                  var result = await sl<Signupusecase>().call(
                    params: Createuserreq(
                      fullname: fullname,
                      email: email,
                      password: password,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                                'Signup successful! Welcome to Spotify.',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.green,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Sign In',
                        textColor: Colors.yellow,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Signin()),
                          );
                        },
                      ),
                    ),
                  );

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Signin()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.white),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text('Signup failed: $e',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                      backgroundColor: Colors.orange,
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 4),
                      action: SnackBarAction(
                        label: 'Retry',
                        textColor: Colors.black,
                        onPressed: () {
                          // Retry logic if needed
                        },
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget RegisterText() {
    return Text(
      'Register',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Satoshi',
        color:
            ThemeCubit().state == ThemeMode.dark ? Colors.white : Colors.black,
      ),
    );
  }
}

Widget ttextfields(
  BuildContext context,
  String hintText,
  TextEditingController controller,
) {
  double screenWidth = MediaQuery.of(context).size.width;
  double horizontalPadding;

  if (screenWidth < 600) {
    horizontalPadding = 35;
  } else if (screenWidth < 900) {
    horizontalPadding = 32;
  } else {
    horizontalPadding = 350;
  }

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: 'Satoshi', color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.all(20),
      ),
    ),
  );
}

Widget _signinText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: 'Satoshi',
            color: ThemeCubit().state == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signin()),
            );
          },
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Satoshi',
              color: Colors.blue,
            ),
          ),
        ),
      ],
    ),
  );
}

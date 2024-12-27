import 'package:flutter/material.dart';
import 'package:spotify_clone/core/usecase/auth/signinusecase.dart';
import 'package:spotify_clone/data/models/auth/signin_userreq.dart';
import 'package:spotify_clone/presentation/pages/SignInSignUp/Signup.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';
import 'package:spotify_clone/presentation/pages/home.dart';
import 'package:spotify_clone/presentation/widgets/button/basicbutton.dart';
import 'package:spotify_clone/servicelocator.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _showPassword = false; // Manage password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _RegisterText(context),
      appBar: AppBar(
        title: Image.asset(
          'images/spotify_logo-removebg-preview.png',
          height: 40,
          width: 250,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Center(child: LoginText()),
          const SizedBox(height: 25),
          ttextfields(context, 'Email', _email), // Email field
          const SizedBox(height: 25),
          ttextfields(
            context,
            'Password',
            _password,
            isPassword: true,
            showPassword: _showPassword,
            togglePasswordVisibility: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ), // Password field with toggle visibility
          const SizedBox(height: 50),
          Container(
            width: 350,
            height: 50,
            child: BasicAppbutton(
              title: 'Login',
              onPressed: () async {
                final email = _email.text.trim();
                final password = _password.text.trim();

                if (email.isEmpty || password.isEmpty) {
                  _showSnackBar(context, 'All fields are required!',
                      Colors.redAccent, Icons.error_outline);
                  return;
                }

                if (!RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+")
                    .hasMatch(email)) {
                  _showSnackBar(context, 'Invalid email format!',
                      Colors.redAccent, Icons.error_outline);
                  return;
                }

                if (password.length < 6) {
                  _showSnackBar(
                      context,
                      'Password must be at least 6 characters long!',
                      Colors.redAccent,
                      Icons.error_outline);
                  return;
                }

                try {
                  final isAuthenticated = await sl<Signinusecase>().call(
                    params: SigninUserreq(email: email, password: password),
                  );

                  if (isAuthenticated.isRight()) {
                    _showSnackBar(
                        context,
                        'SignIn successful! Welcome to Spotify.',
                        Colors.green,
                        Icons.check_circle_outline);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }
                } catch (e) {
                  _showSnackBar(context, 'SignIn failed: $e', Colors.orange,
                      Icons.warning_amber_rounded);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message,
      Color backgroundColor, IconData icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
                child:
                    Text(message, style: const TextStyle(color: Colors.white))),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

Widget LoginText() {
  return Text(
    'Login',
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Satoshi',
      color: ThemeCubit().state == ThemeMode.dark ? Colors.white : Colors.black,
    ),
  );
}

Widget ttextfields(
  BuildContext context,
  final String hintText,
  TextEditingController controller, {
  bool isPassword = false,
  bool showPassword = false,
  VoidCallback? togglePasswordVisibility,
}) {
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
      obscureText:
          isPassword && !showPassword, // Toggle obscure text for passwords
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(fontFamily: 'Satoshi', color: Colors.grey),
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.all(20),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
    ),
  );
}

Widget _RegisterText(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account yet?',
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
              MaterialPageRoute(
                builder: (context) => Signup(),
              ),
            );
          },
          child: const Text(
            'Register',
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

import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/pages/get_started.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    super.initState();

    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: 350,
        child: Image.asset('images/spotify_logo-removebg-preview.png'),
      ),
    ));
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStartedPage(),
      ),
    );
  }
}

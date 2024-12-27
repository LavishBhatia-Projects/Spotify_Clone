import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';
import 'package:spotify_clone/presentation/widgets/button/backbutton.dart';

class Audioplayerpage extends StatefulWidget {
  final String musicPath;
  final String title;
  final String artist;
  final String imagePath;

  const Audioplayerpage({
    super.key,
    required this.musicPath,
    required this.title,
    required this.artist,
    required this.imagePath,
  });

  @override
  State<Audioplayerpage> createState() => _AudioplayerpageState();
}

class _AudioplayerpageState extends State<Audioplayerpage> {
  final player = AudioPlayer();
  Duration position = Duration.zero;
  Duration duration = Duration.zero;
  late StreamSubscription<Duration?> durationListener;
  late StreamSubscription<Duration> positionListener;
  late StreamSubscription<PlayerState> playerStateListener;

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void togglePlayPause() {
    if (player.playing) {
      player.pause();
    } else {
      player.play();
    }
  }

  void seekPosition(double value) {
    player.seek(Duration(seconds: value.toInt()));
  }

  void skipForward() {
    final newPosition = position + Duration(seconds: 10);
    if (newPosition < duration) {
      player.seek(newPosition);
    } else {
      player.seek(duration);
    }
  }

  void skipBackward() {
    final newPosition = position - Duration(seconds: 10);
    if (newPosition > Duration.zero) {
      player.seek(newPosition);
    } else {
      player.seek(Duration.zero);
    }
  }

  @override
  void initState() {
    super.initState();
    player.setAsset(widget.musicPath).catchError((error) {
      // Handle error if the asset cannot be loaded
      debugPrint('Error loading asset: $error');
    });

    durationListener = player.durationStream.listen((d) {
      if (d != null) {
        setState(() {
          duration = d;
        });
      }
    });

    positionListener = player.positionStream.listen((event) {
      setState(() => position = event);
    });

    playerStateListener = player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          position = Duration.zero;
        });
        player.pause();
        player.seek(position);
      }
    });
  }

  @override
  void dispose() {
    durationListener.cancel();
    positionListener.cancel();
    playerStateListener.cancel();
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Image.asset(
          'images/spotify_logo-removebg-preview.png',
          height: 40,
          width: 250,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: ThemeCubit().state == ThemeMode.dark
                        ? Colors.black26
                        : Colors.green,
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
                border: Border.all(
                  color: ThemeCubit().state == ThemeMode.dark
                      ? Colors.black
                      : Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              widget.artist,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(formatDuration(position)),
                Text(formatDuration(duration)),
              ],
            ),
            Slider(
              activeColor: Colors.green,
              inactiveColor: Colors.green.withOpacity(0.5),
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds
                  .toDouble()
                  .clamp(0.0, duration.inSeconds.toDouble()),
              onChanged: seekPosition,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: skipBackward,
                  icon: Icon(Icons.replay_10, size: 36, color: Colors.green),
                ),
                ElevatedButton(
                  onPressed: togglePlayPause,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: ThemeCubit().state == ThemeMode.dark
                        ? Colors.green
                        : Colors.black,
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Icon(
                    player.playing ? Icons.pause : Icons.play_arrow,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: skipForward,
                  icon: Icon(Icons.forward_10, size: 36, color: Colors.green),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

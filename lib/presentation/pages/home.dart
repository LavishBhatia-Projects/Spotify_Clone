import 'package:flutter/material.dart';
import 'package:spotify_clone/music_Containers.dart';
import 'package:spotify_clone/presentation/pages/choosemode/themecubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(child: homeartistcontainer()),
          const SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: Center(
              child: Text(
                'Listen To Music',
                style: TextStyle(
                    color: ThemeCubit().state == ThemeMode.dark
                        ? Colors.black
                        : Colors.white,
                    fontFamily: 'Satoshi',
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: const Row(children: [
              Padding(padding: EdgeInsets.only(left: 20, right: 20)),
              MusicContainers(
                title: 'Baawe',
                artist: 'Raftaar',
                imagePath: 'images/hdv2.jpeg',
                musicPath:
                    'musics/TRACK 6  RAFTAAR - BAAWE (Explicit Warning)  HARD DRIVE Vol. 2   Official Visualiser.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'Brown Rang',
                artist: 'Yo Yo Honey Singh',
                imagePath: 'images/honey.jpg',
                musicPath: 'musics/brown_rang.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'Luther',
                artist: 'kendrick Lamar',
                imagePath: 'images/gnx.jpg',
                musicPath:
                    'musics/Kendrick Lamar - luther (Lyrics) ft. SZA.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'Middle Child',
                artist: 'J.Cole',
                imagePath: 'images/middle Child.jpeg',
                musicPath: 'musics/J. Cole - MIDDLE CHILD.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'No Role Modelz',
                artist: 'J.Cole',
                imagePath: 'images/j cole.jpg',
                musicPath: 'musics/No Role Modelz.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'What They Want',
                artist: 'Russ',
                imagePath: 'images/Russ.jpeg',
                musicPath: 'musics/Russ - What They Want (Official Video).mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'Dope Shope',
                artist: 'Yo Yo Honey Singh',
                imagePath: 'images/honey.jpg',
                musicPath:
                    'musics/Dope Shope ( LYRICS )  Yo Yo Honey Singh  Deep Money  International Villager  Deep Lyrics.mp3',
              ),
              SizedBox(
                width: 10,
              ),
              MusicContainers(
                title: 'Dehsat ho',
                artist: 'Raftaar',
                imagePath: 'images/hdv2.jpeg',
                musicPath:
                    'musics/TRACK 2  RAFTAAR - DEHSHAT HO (Explicit Warning)  HARD DRIVE Vol. 2  Official Visualiser.ogg',
              ),
            ]),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 35),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Trending..',
                style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 30,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Padding(padding: EdgeInsets.all(45)),
              TrendingMusic('tv_off', 'Kendrick Lamar', 'images/gnx.jpg'),
              SizedBox(
                width: 170,
              ),
              TrendingMusic('Me and My browski', 'Raftaar', 'images/hdv2.jpeg'),
              SizedBox(
                width: 170,
              ),
              TrendingMusic(
                  'Millionaire', 'YO YO Honey Singh', 'images/honey.jpg'),
            ]),
          ),
          SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Padding(padding: EdgeInsets.all(45)),
              TrendingMusic('Stealth Mode', 'J.Cole', 'images/j cole.jpg'),
              SizedBox(
                width: 170,
              ),
              TrendingMusic('Payal', 'Yo Yo Honey Singh', 'images/honey.jpg'),
              SizedBox(
                width: 170,
              ),
              TrendingMusic('Psycho', 'Russ', 'images/Russ.jpeg'),
            ]),
          ),
          SizedBox(
            height: 60,
          )
        ],
      )),
    );
  }

  Widget homeartistcontainer() {
    return Container(
      height: 110,
      width: 600,
      child: Stack(children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            width: 600,
            'images/home_top_card-removebg-preview.png',
            fit: BoxFit.fill,
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 800,
              width: 100,
              child: Image.asset(
                height: 700,
                'images/home_artist - Copy.png',
                fit: BoxFit.fill,
              ),
            ))
      ]),
    );
  }

  Widget TrendingMusic(String Name, String Artist, String imagePath) {
    return Container(
      height: 80, // Increased height for better text spacing
      width: 320, // Adjusted width for better fit
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeCubit().state == ThemeMode.dark
              ? Colors.white
              : Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeCubit().state == ThemeMode.dark
                ? Colors.black26
                : Colors.white,
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        color:
            ThemeCubit().state == ThemeMode.dark ? Colors.white : Colors.black,
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Name,
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 18,
                    fontWeight: FontWeight.bold, // Emphasizing song name
                    color: ThemeCubit().state == ThemeMode.dark
                        ? Colors.black
                        : Colors.white,
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Prevents overflow if the name is too long
                  maxLines: 1,
                ),
                SizedBox(height: 4),
                Text(
                  Artist,
                  style: TextStyle(
                    fontFamily: 'Satoshi',
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ThemeCubit().state == ThemeMode.dark
                        ? Colors.grey[700]
                        : Colors.grey[400],
                  ),
                  overflow: TextOverflow
                      .ellipsis, // Prevents overflow if the artist name is too long
                  maxLines: 1,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.star,
              color: ThemeCubit().state == ThemeMode.dark
                  ? Colors.amber
                  : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}

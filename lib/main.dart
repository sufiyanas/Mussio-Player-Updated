import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:music_player/db/songs.dart';
import 'package:music_player/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(AllSongsAdapter());
  }
  await Hive.openBox<AllSongs>('AllSongs');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

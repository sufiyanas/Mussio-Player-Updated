import 'package:flutter/material.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({Key? key}) : super(key: key);
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xFFff0A0A0A),
              Colors.white24,
            ])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                // border: Border.all(width: 3.0),
                borderRadius: const BorderRadius.all(Radius.circular(
                        30.0) //                 <--- border radius here
                    ),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, color: theamcoloryellow)),
            ),
            actions: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined),
                    color: theamcoloryellow,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[850],
                      // border: Border.all(width: 3.0),
                      borderRadius: const BorderRadius.all(Radius.circular(
                              30.0) //                 <--- border radius here
                          ),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: theamcoloryellow,
                        )),
                  )
                ],
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                    title: const Text('Liked Songs',
                        style: TextStyle(color: Colors.white, fontSize: 35)),
                    subtitle: const Text('2015 10 Songs',
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w300)),
                    trailing: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[850],
                        // border: Border.all(width: 3.0),
                        borderRadius: const BorderRadius.all(Radius.circular(
                                50.0) //                 <--- border radius here
                            ),
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.play_arrow_rounded,
                            color: theamcoloryellow,
                            size: 25,
                          )),
                    )),
                Column(
                  children: [
                    songslistFunction(Title: '1  Money On My Mind'),
                    songslistFunction(Title: '2  Good Thing'),
                    songslistFunction(Title: '3  Stay With Me'),
                    songslistFunction(Title: '4  Leave Your Lover'),
                    songslistFunction(Title: "5  I'm not The only One "),
                    songslistFunction(Title: "6  Money On MY Mind  "),
                    songslistFunction(Title: "7  I'm not The only One "),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget songslistFunction({
    required Title,
  }) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    return ListTile(
      title: Text(
        '$Title',
        style: const TextStyle(fontSize: 20, color: Colors.white),
      ),
      trailing: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert_rounded,
            color: theamcoloryellow,
          )),
    );
  }
}

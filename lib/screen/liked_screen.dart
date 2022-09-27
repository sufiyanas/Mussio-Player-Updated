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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon:
                      Icon(Icons.arrow_back_ios_new, color: theamcoloryellow)),
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
                    songslistFunction(
                        Title: 'Money On My Mind', indextext: '1'),
                    songslistFunction(Title: 'Good Thing', indextext: '2'),
                    songslistFunction(Title: 'Stay With Me', indextext: '3'),
                    songslistFunction(
                        Title: 'Leave Your Lover', indextext: '4'),
                    songslistFunction(
                        Title: "I'm not The only One", indextext: '5'),
                    songslistFunction(
                        Title: "Money On MY Mind  ", indextext: '6'),
                    songslistFunction(
                        Title: "I'm not The only One", indextext: 7),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Widget songslistFunction({
    required Title,
    required indextext,
  }) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    return ListTile(
      title: Row(
        children: [
          Text(
            ' $indextext  ',
            style: TextStyle(
              fontSize: 20,
              color: theamcoloryellow,
            ),
          ),
          Text(
            '$Title',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
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

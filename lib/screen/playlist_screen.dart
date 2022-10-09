import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            // border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(Radius.circular(30.0) //
                ),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: theamcoloryellow,
            ),
          ),
        ),
        actions: [
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
                Icons.search,
                color: theamcoloryellow,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFff0A0A0A),
              Color.fromARGB(255, 109, 102, 102),
            ],
          ),
        ),
        child: Column(
          children: [
            //this container is for color gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFff0A0A0A),
                    Colors.white24,
                    Color.fromARGB(174, 208, 131, 76),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/image/librarry-img-1.jpg')),
                  SizedBox(),
                  ListTile(
                    title: Text(
                      'In the Lonely Hour ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    subtitle: Text('210 Songs',
                        style: TextStyle(color: Colors.white)),
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            playlistsongsfunction(
                Songname: 'Money On the Mind', titleindex: '1  '),
            playlistsongsfunction(Songname: 'Good Thing', titleindex: '2  '),
            playlistsongsfunction(Songname: 'stay With Me ', titleindex: '3  '),
            playlistsongsfunction(
                Songname: 'Leave Your Lover', titleindex: '4  '),
            playlistsongsfunction(
                Songname: "I'm Not The Only One", titleindex: '5  '),
          ],
        ),
      ),
    );
  }
}

Widget playlistsongsfunction({required String Songname, required titleindex}) {
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  return ListTile(
    title: Row(
      children: [
        Text(titleindex,
            style: TextStyle(color: theamcoloryellow, fontSize: 20)),
        Text(Songname, style: TextStyle(color: Colors.white, fontSize: 20)),
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

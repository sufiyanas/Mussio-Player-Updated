import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color theamcoloryellow = const Color(0xFFEA6C0F);
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
        body: SafeArea(
          child: Stack(children: [
            Positioned(
                child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white12,
                    const Color(0xFFEA6C0F),
                    Colors.black54,
                  ])),
            )),
            Positioned(
                child: Image(
              image: AssetImage('assets/image/librarry-img-1.jpg'),
            )),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
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
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.amber[600],
                        )),
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
                          Icons.search,
                          color: Colors.amber[600],
                        )),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class playllistcard extends StatelessWidget {
  const playllistcard(
      {Key? key, required this.imageUrl, required this.libraryName})
      : super(key: key);
  final imageUrl;
  final libraryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      color: Colors.transparent,
      // width: 180,
      // height: 200,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image(
              /////want to do medoia query
              width: 200,
              height: 180,
              fit: BoxFit.cover,
              image: AssetImage(imageUrl),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            libraryName,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

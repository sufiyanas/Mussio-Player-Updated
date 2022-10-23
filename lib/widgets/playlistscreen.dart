import 'package:flutter/material.dart';

class playllistcard extends StatelessWidget {
  const playllistcard(
      {Key? key, required this.imageUrl, required this.libraryName})
      : super(key: key);
  final imageUrl;
  final libraryName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
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
          const SizedBox(
            height: 5,
          ),
          Text(
            libraryName,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

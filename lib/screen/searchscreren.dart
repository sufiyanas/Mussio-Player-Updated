import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Color theamcoloryellow = const Color(0xFFEA6C0F);
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          decoration: BoxDecoration(
            color: Colors.grey[850],
            // border: Border.all(width: 3.0),
            borderRadius: const BorderRadius.all(
                Radius.circular(30.0) //                 <--- border radius here
                ),
          ),
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_outlined)),
        ),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 23, 23, 23),
                // Color(0xFFEA6C0F),
                Color.fromARGB(160, 25, 20, 20),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 10, right: 10),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 211, 200, 200),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: "Search the song here",
                    labelStyle: TextStyle(color: Colors.brown),
                    prefixIcon: Icon(
                      Icons.search,
                      color: theamcoloryellow,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

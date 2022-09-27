import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

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
              // gradient: LinearGradient(
              //   begin: Alignment.topCenter,
              //   end: Alignment.bottomCenter,
              //   colors: [
              //     Color.fromARGB(255, 0, 0, 0),
              //     Color.fromARGB(255, 23, 23, 23),
              //     // Color(0xFFEA6C0F),
              //     Color.fromARGB(160, 25, 20, 20),
              //   ],
              // ),
              ),
          child: ListView()),
    );
  }
}

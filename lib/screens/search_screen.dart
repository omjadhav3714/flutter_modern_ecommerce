import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const CupertinoSearchTextField(),
      ),
    );
  }
}

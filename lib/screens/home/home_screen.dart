import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/lists.dart';
import 'package:modern_ecommerce/screens/home/gallery_screen.dart';
import 'package:modern_ecommerce/static/custom_search_widget.dart';
import 'package:modern_ecommerce/utils/category_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: const CustomSearchWidget(),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: primaryColor,
            indicatorWeight: 4,
            tabs: List.generate(
              10,
              (index) => customTabs[index],
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            10,
            (index) => GalleryScreen(
              cat: mainCat[index],
            ),
          ),
        ),
      ),
    );
  }
}

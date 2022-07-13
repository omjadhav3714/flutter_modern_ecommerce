import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/static/custom_search_widget.dart';
import 'package:modern_ecommerce/widgets/custom_tab_widget.dart';

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
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: primaryColor,
            indicatorWeight: 4,
            tabs: [
              CustomTabWidget(
                label: men,
              ),
              CustomTabWidget(
                label: women,
              ),
              CustomTabWidget(
                label: shoes,
              ),
              CustomTabWidget(
                label: kids,
              ),
              CustomTabWidget(
                label: gaming,
              ),
              CustomTabWidget(
                label: mobile,
              ),
              CustomTabWidget(
                label: pc,
              ),
              CustomTabWidget(
                label: bags,
              ),
              CustomTabWidget(
                label: accessories,
              ),
              CustomTabWidget(
                label: electronics,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text("Dummy1"),
            ),
            Center(
              child: Text("Dummy2"),
            ),
            Center(
              child: Text("Dummy3"),
            ),
            Center(
              child: Text("Dummy4"),
            ),
            Center(
              child: Text("Dummy5"),
            ),
            Center(
              child: Text("Dummy6"),
            ),
            Center(
              child: Text("Dummy7"),
            ),
            Center(
              child: Text("Dummy8"),
            ),
            Center(
              child: Text("Dummy9"),
            ),
            Center(
              child: Text("Dummy10"),
            ),
          ],
        ),
      ),
    );
  }
}

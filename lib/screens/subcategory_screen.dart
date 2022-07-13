import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';

class SubCategoryScreen extends StatelessWidget {
  final String mainCatName;
  final String subCatName;
  const SubCategoryScreen(
      {Key? key, required this.mainCatName, required this.subCatName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        title: AppBarTitle(title: subCatName),
        leading: const BackButtonWidget(),
      ),
      body: Center(
        child: Text(
          subCatName,
          style: const TextStyle(color: black),
        ),
      ),
    );
  }
}

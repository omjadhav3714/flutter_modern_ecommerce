import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/lists.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class ManageProductsScreen extends StatefulWidget {
  const ManageProductsScreen({Key? key}) : super(key: key);

  @override
  State<ManageProductsScreen> createState() => _ManageProductsScreenState();
}

class _ManageProductsScreenState extends State<ManageProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        leading: const BackButtonWidget(),
        title: AppBarTitle(
          title: dash[3],
        ),
      ),
      body: const Center(
        child: Text("ManageProducts"),
      ),
    );
  }
}

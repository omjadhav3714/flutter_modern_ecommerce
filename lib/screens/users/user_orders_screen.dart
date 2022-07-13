import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({Key? key}) : super(key: key);

  @override
  State<UserOrderScreen> createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        leading: const BackButtonWidget(),
        title: const AppBarTitle(
          title: orders,
        ),
      ),
      body: const Center(
        child: Text("UserOrderScreen"),
      ),
    );
  }
}

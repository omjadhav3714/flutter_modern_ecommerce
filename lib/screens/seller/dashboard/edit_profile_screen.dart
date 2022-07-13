import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/lists.dart';

import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        leading: const BackButtonWidget(),
        title: AppBarTitle(
          title: dash[2],
        ),
      ),
      body: const Center(
        child: Text("EditProfile"),
      ),
    );
  }
}

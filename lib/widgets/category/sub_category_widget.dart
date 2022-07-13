import 'package:flutter/material.dart';
import 'package:modern_ecommerce/screens/subcategory_screen.dart';

class SubCategoryWidget extends StatelessWidget {
  final String catName;
  final String subCatName;
  final String assetName;
  final String subCatLabel;
  const SubCategoryWidget({
    Key? key,
    required this.catName,
    required this.subCatName,
    required this.assetName,
    required this.subCatLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryScreen(
              subCatName: subCatName,
              mainCatName: catName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.2,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(
            subCatLabel,
            style: const TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

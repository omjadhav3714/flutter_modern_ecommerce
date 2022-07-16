import 'package:flutter/material.dart';
import 'package:modern_ecommerce/widgets/category/category_header_widget.dart';
import 'package:modern_ecommerce/widgets/category/slidebar_widget.dart';
import 'package:modern_ecommerce/widgets/category/sub_category_widget.dart';

class CategoryWidget extends StatefulWidget {
  final String catName;
  final String assestName;
  final List<String> subCat;
  const CategoryWidget(
      {Key? key,
      required this.catName,
      required this.assestName,
      required this.subCat})
      : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: size.height * 0.8,
              width: size.width * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryHeader(
                    label: widget.catName,
                  ),
                  SizedBox(
                    height: size.height * 0.65,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(
                        widget.subCat.length - 1,
                        (index) => SubCategoryWidget(
                          catName: widget.catName,
                          subCatName: widget.subCat[index + 1],
                          assetName: widget.assestName + '$index.jpg',
                          subCatLabel: widget.subCat[index + 1],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: SlideBar(
              size: size,
              catName: widget.catName,
            ),
          ),
        ],
      ),
    );
  }
}

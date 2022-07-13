import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/search_screen.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ),
        );
      },
      child: Container(
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: primaryColor, width: 1.2),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SizedBox(
                  width: 3.0,
                ),
                Icon(
                  Icons.search,
                  color: grey,
                ),
                Text(
                  searchTxt,
                  style: TextStyle(
                    color: grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(color: primaryColor, width: 1.2),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  search,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

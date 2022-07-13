import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;
  const CartScreen({Key? key, this.back}) : super(key: key);
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        centerTitle: true,
        leading: widget.back ?? Container(),
        title: const AppBarTitle(title: cart),
      ),
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      Container(
                        width: 140,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('images/men/men0.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'product name',
                            style: TextStyle(fontSize: 22),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "ref ",
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.7)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '20',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('50',
                                  style: TextStyle(
                                    fontSize: 22,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: black.withOpacity(0.5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.minimize,
                                        size: 10,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: black.withOpacity(0.5))),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 10,
                                        color: black.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total : Rs.500",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(50 / 2)),
            child: Center(
              child: Text(
                "Checkout".toUpperCase(),
                style: const TextStyle(
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

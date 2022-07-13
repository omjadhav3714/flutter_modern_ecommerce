import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/users/cart_screen.dart';
import 'package:modern_ecommerce/screens/users/user_orders_screen.dart';
import 'package:modern_ecommerce/screens/users/wishlist_screen.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/profile_data_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: white,
        title: const AppBarTitle(title: profile),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: const Icon(
              Icons.logout,
              color: black,
            ),
          ),
        ],
      ),
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage("images/men/men0.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Daniel",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Member since 2019",
                    style:
                        TextStyle(fontSize: 13, color: black.withOpacity(0.7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "EDIT ACCOUNT",
                          style: TextStyle(fontSize: 13, color: white),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                label: cart,
                data: Icons.shopping_cart,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(
                        back: BackButtonWidget(),
                      ),
                    ),
                  );
                },
              ),
              CustomIconButton(
                label: orders,
                data: Icons.shopping_bag,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserOrderScreen(),
                    ),
                  );
                },
              ),
              CustomIconButton(
                label: wishlist,
                data: Icons.favorite,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WishListScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Divider(
          thickness: 1,
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: const [
              ProfileText(
                label: accountInfo,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 25,
              ),
              ProfileData(
                label: 'Name',
                labelData: 'Om',
                data: Icons.person,
              ),
              SizedBox(
                height: 25,
              ),
              ProfileText(
                label: accountSettings,
              ),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileText extends StatelessWidget {
  final String label;
  const ProfileText({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: black.withOpacity(0.5),
      ),
    );
  }
}

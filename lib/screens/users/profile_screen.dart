import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:modern_ecommerce/widgets/custom_dialogs.dart';
import 'package:modern_ecommerce/widgets/profile_data_widget.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var userId = FirebaseAuth.instance.currentUser!.uid;
    CollectionReference users =
        FirebaseFirestore.instance.collection(userCollection);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Center(child: Text("Document does not exist"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: white,
              title: const AppBarTitle(title: profile),
              actions: [
                IconButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: CustomConfirmDialog(
                          title: logout,
                          subtitle: sureLogout,
                          icon: Icons.logout,
                          onYesPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            Navigator.pushReplacementNamed(context, initial);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: black,
                  ),
                ),
              ],
            ),
            backgroundColor: white,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    children: [
                      data[profileImgC] == null
                          ? Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      guestAsset,
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            )
                          : Container(
                              width: 130,
                              height: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      data[profileImgC],
                                    ),
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
                            data[names] ?? signinguest,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            data[emails] ?? signinguest,
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.7)),
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
                                  editAc,
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
                    children: [
                      const ProfileText(
                        label: accountInfo,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      ProfileData(
                        label: address,
                        labelData: data[address] ?? noAdd,
                        data: Icons.apartment,
                      ),
                      ProfileData(
                        label: phone,
                        labelData: data[phone] ?? noPhone,
                        data: Icons.phone,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const ProfileText(
                        label: accountSettings,
                      ),
                      SizedBox(
                        height: 60,
                        child: CustomIconButton(
                          label: logout,
                          data: Icons.logout,
                          onPress: () async {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: CustomConfirmDialog(
                                  title: logout,
                                  subtitle: sureLogout,
                                  icon: Icons.logout,
                                  onYesPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.pushReplacementNamed(
                                        context, initial);
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        child: CustomIconButton(
                          label: changePass,
                          data: Icons.edit,
                          onPress: () {},
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return Text("loading");
      },
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

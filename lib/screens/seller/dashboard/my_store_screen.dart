import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';
import 'package:modern_ecommerce/widgets/product_card_widget.dart';

class MyStoreScreen extends StatefulWidget {
  final String documentId;
  const MyStoreScreen({Key? key, required this.documentId}) : super(key: key);

  @override
  State<MyStoreScreen> createState() => _MyStoreScreenState();
}

class _MyStoreScreenState extends State<MyStoreScreen>
    with TickerProviderStateMixin {
  bool isFollowing = false;
  AnimationController? animationController;
  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection(sellerCollection);
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection(productsCollection)
        .where('seller-id', isEqualTo: widget.documentId)
        .snapshots(includeMetadataChanges: true);

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text(wentWrong);
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text(noData);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: white,
              centerTitle: true,
              elevation: 0,
              title: const AppBarTitle(
                title: myStore,
              ),
              leading: const BackButtonWidget(),
            ),
            body: StreamBuilder<QuerySnapshot>(
              stream: _productsStream,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text(wentWrong);
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(noData),
                  );
                }

                return GridView(
                  padding: const EdgeInsets.all(8),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    snapshot.data!.docs.length,
                    (int index) {
                      final int count = snapshot.data!.docs.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return ProductCard(
                        animation: animation,
                        animationController: animationController,
                        data: snapshot.data!.docs[index],
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 0.8,
                  ),
                );
              },
            ),
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      },
    );
  }
}

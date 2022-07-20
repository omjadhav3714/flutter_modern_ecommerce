import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/visit_store_screen.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        elevation: 0,
        title: const AppBarTitle(
          title: store,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            FirebaseFirestore.instance.collection(sellerCollection).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 25,
                mainAxisSpacing: 25,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VisitStoreScreen(
                          documentId: snapshot.data!.docs[index]['id'],
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: Image.asset(storeAsset),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: SizedBox(
                              height: 60,
                              width: 100,
                              child: Image.network(
                                snapshot.data!.docs[index]['seller-logo'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        snapshot.data!.docs[index]['seller-name'],
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text(noData),
          );
        },
      ),
    );
  }
}

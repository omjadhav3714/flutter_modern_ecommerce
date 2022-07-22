import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/screens/products/carousel_full_screen.dart';
import 'package:modern_ecommerce/static/backbutton_widget.dart';
import 'package:modern_ecommerce/widgets/buttons/custom_icon_button_widget.dart';
import 'package:modern_ecommerce/widgets/hyphen_text_header_widget.dart';

class ProductDetail extends StatefulWidget {
  final String category;
  final String id;
  const ProductDetail({Key? key, required this.category, required this.id})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _productsStream = FirebaseFirestore.instance
        .collection(productsCollection)
        .where('category', isEqualTo: widget.category)
        .snapshots(includeMetadataChanges: true);
    final Stream<DocumentSnapshot> singleProductStream = FirebaseFirestore
        .instance
        .collection(productsCollection)
        .doc(widget.id)
        .snapshots(includeMetadataChanges: true);

    return Material(
      child: SafeArea(
        child: Scaffold(
          body: StreamBuilder<DocumentSnapshot>(
            stream: singleProductStream,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenView(
                                    imagesList: snapshot.data!['images'],
                                  ),
                                ),
                              );
                            },
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 400.0,
                                aspectRatio: 2.0,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                initialPage: 2,
                                autoPlay: true,
                              ),
                              items: List.generate(
                                snapshot.data!['images'].length,
                                (index) => Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  decoration: const BoxDecoration(color: white),
                                  child: Image.network(
                                    snapshot.data!['images'][index],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: 15,
                          top: 20,
                          child: BackButtonWidget(),
                        ),
                        Positioned(
                          right: 15,
                          top: 20,
                          child: CircleAvatar(
                            backgroundColor: primaryColor,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      snapshot.data!['name'],
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Rs " + snapshot.data!['price'].toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 18,
                            letterSpacing: 0.27,
                            color: grey,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: primaryColor,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      snapshot.data!['quantity'].toString() + quantityA,
                      style: const TextStyle(
                        fontSize: 16,
                        color: grey,
                      ),
                    ),
                    const HyphenTextHeader(
                      head: productD,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        snapshot.data!['desc'],
                        textScaleFactor: 1.1,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          color: grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const HyphenTextHeader(
                      head: relatedI,
                    ),
                    SizedBox(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: _productsStream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text(wentWrong);
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
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

                          return SingleChildScrollView(
                            child: Column(
                              children: List<Widget>.generate(
                                snapshot.data!.docs.length,
                                (int index) {
                                  return ListTile(
                                    leading: Image.network(
                                      snapshot.data!.docs[index]['images'][0],
                                    ),
                                    title: Text(
                                      snapshot.data!.docs[index]['name'],
                                    ),
                                    subtitle: Text(
                                      snapshot.data!.docs[index]
                                          ['sub-category'],
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              );
            },
          ),
          bottomSheet: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.store,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_outline,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              CustomIconButton(
                label: addToCart,
                data: Icons.shopping_cart,
                onPress: () {},
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

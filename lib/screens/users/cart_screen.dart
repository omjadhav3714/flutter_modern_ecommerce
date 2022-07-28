import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modern_ecommerce/constants/colors.dart';
import 'package:modern_ecommerce/constants/strings.dart';
import 'package:modern_ecommerce/providers/cart_provider.dart';
import 'package:modern_ecommerce/widgets/appbar_title_widget.dart';
import 'package:modern_ecommerce/widgets/custom_dialogs.dart';
import 'package:provider/provider.dart';

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
        actions: [
          context.watch<Cart>().getItems.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: CustomConfirmDialog(
                          title: clearCart,
                          subtitle: sureToClearCart,
                          icon: Icons.delete_forever,
                          onYesPressed: () {
                            context.read<Cart>().clearCart();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: black,
                  ),
                )
              : Container(),
        ],
      ),
      backgroundColor: white,
      body: context.watch<Cart>().getItems.isNotEmpty
          ? Consumer<Cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  itemCount: cart.count,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Column(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 130,
                                        height: 130,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              cart.getItems[index].imageUrls[0],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Flexible(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cart.getItems[index].name,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              rs +
                                                  cart.getItems[index].price
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: black.withOpacity(0.7),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: black
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: cart
                                                                    .getItems[
                                                                        index]
                                                                    .qty ==
                                                                1
                                                            ? IconButton(
                                                                onPressed: () {
                                                                  cart.removeItem(
                                                                      cart.getItems[
                                                                          index]);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  size: 15,
                                                                  color: black
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              )
                                                            : IconButton(
                                                                onPressed: () {
                                                                  cart.decrement(
                                                                      cart.getItems[
                                                                          index]);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .minimize,
                                                                  size: 15,
                                                                  color: black
                                                                      .withOpacity(
                                                                          0.5),
                                                                ),
                                                              ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      cart.getItems[index].qty
                                                          .toString(),
                                                      style:
                                                          cart.getItems[index]
                                                                      .qty ==
                                                                  cart
                                                                      .getItems[
                                                                          index]
                                                                      .quantity
                                                              ? const TextStyle(
                                                                  fontSize: 15,
                                                                  color:
                                                                      primaryColor,
                                                                )
                                                              : const TextStyle(
                                                                  fontSize: 15,
                                                                ),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        border: Border.all(
                                                          color: black
                                                              .withOpacity(0.5),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: IconButton(
                                                          onPressed: cart
                                                                      .getItems[
                                                                          index]
                                                                      .qty ==
                                                                  cart
                                                                      .getItems[
                                                                          index]
                                                                      .quantity
                                                              ? null
                                                              : () {
                                                                  cart.increment(
                                                                      cart.getItems[
                                                                          index]);
                                                                },
                                                          icon: Icon(
                                                            Icons.add,
                                                            size: 15,
                                                            color: black
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
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
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    );
                  },
                );
              },
            )
          : const Center(
              child: Text(
                noData,
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                ),
              ),
            ),
      bottomSheet: context.watch<Cart>().getItems.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50 / 2),
                ),
                child: Center(
                  child: Text(
                    checkout +
                        context.watch<Cart>().totalPrice.toStringAsFixed(2),
                    style: const TextStyle(
                      color: white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

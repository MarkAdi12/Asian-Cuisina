import 'package:finals_project/models/cart_controller.dart';
import 'package:finals_project/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  final CartController cartController = Get.find();

  CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Cart',
          textAlign: TextAlign.right,
          style: GoogleFonts.raleway(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 8, top: 10),
              child: Row(
                children: [
                  Text(
                    'Order Summary:',
                    style: GoogleFonts.raleway(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StatefulBuilder(builder: (context, setState) {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = controller.cartItems[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          item.label,
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        subtitle: Text(
                          item.price,
                          style: GoogleFonts.abel(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.delete,
                        ),
                        onTap: () {
                          setState(() {
                            cartController.removeToCart(index);
                          });
                        },
                      ),
                    );
                  },
                );
              }),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            '₱${controller.calculateTotal()}',
                            style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      if (controller.cartItems.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Empty Cart',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              content: Text(
                                'You have no items in the cart.',
                                style: GoogleFonts.raleway(
                                    fontWeight: FontWeight.bold),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      } else {
                        var orderNumber =
                            (Random().nextInt(100) + 3200).toString();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(
                                'Successfully Ordered!',
                                style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              content: Text(
                                'Order No# $orderNumber\nTotal Price is ₱${controller.calculateTotal()}\n\nThanks For Ordering!',
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    print('Order No:$orderNumber');
                                    cartController.orderedItems();
                                    cartController.restartCart();
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const IntroPage()),
                                    );
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                    ),
                    child: Text(
                      'Place Order',
                      style: GoogleFonts.raleway(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

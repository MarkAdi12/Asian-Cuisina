import 'package:finals_project/models/bottom_bar.dart';
import 'package:finals_project/models/fil_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/cart_controller.dart';

class Sides extends StatefulWidget {
  const Sides({super.key});

  @override
  State<Sides> createState() => _SidesState();
}

class _SidesState extends State<Sides> {
  int currentindex = 0;
  final cartController = Get.put(CartController());
  List<FilDish> dishes = [
    FilDish(
        label: 'Plain Rice',
        image: 'assets/s1.jpg',
        pax: '1 pax',
        text: '0 Mins To Serve',
        price: '30.00'),
    FilDish(
        label: 'Garlic Rice',
        image: 'assets/garlicrice.jpg',
        pax: '1 pax',
        text: '25 Mins To Serve',
        price: '40.00'),
    FilDish(
        label: 'Kimchi',
        image: 'assets/kimchi.webp',
        pax: '1 to 2 pax',
        text: '20 Mins To Serve',
        price: '100.00'),
    FilDish(
        label: 'Mushroom Soup',
        image: 'assets/mushroomsoup.jpg',
        pax: '1 to 2 pax',
        text: '20 Mins To Serve',
        price: '90.00'),
    FilDish(
        label: 'Water',
        image: 'assets/water.jpg',
        pax: '0 pax',
        text: '25 Mins To Serve',
        price: '0.00'),
    FilDish(
        label: 'Ice Tea',
        image: 'assets/icetea.jpg',
        pax: '2 to 3 pax',
        text: '25 Mins To Serve',
        price: '120.00'),
    FilDish(
        label: 'Melona',
        image: 'assets/melona.jpg',
        pax: '1 pax',
        text: '0 Mins To Serve',
        price: '120.00'),
    FilDish(
        label: 'Soju',
        image: 'assets/soju.jpg',
        pax: '1 pax',
        text: '0 Mins To Serve',
        price: '150.00'),
    FilDish(
        label: 'San Mig Apple',
        image: 'assets/sanmig.webp',
        pax: '1 pax',
        text: '0 Mins To Serve',
        price: '70.00'),
    FilDish(
        label: 'Red Horse',
        image: 'assets/redhorse.jpg',
        pax: '1 pax',
        text: '0 Mins To Serve',
        price: '70.00'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sides And Beverages',
          textAlign: TextAlign.right,
          style: GoogleFonts.raleway(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: dishes.length,
        itemBuilder: (context, index) {
          return ContainerBuilder(dishes[index]);
        },
      ),
      bottomNavigationBar: const NavBar(),
    );
  }

  Widget ContainerBuilder(FilDish dish) {
    int quantity = 1;

    return StatefulBuilder(builder: (context, setState) {
      return Container(
        margin: const EdgeInsets.fromLTRB(10.0, 8.0, 15.0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                dish.image,
                height: 150,
                width: 400,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      dish.label,
                      style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (quantity > 1) {
                          setState(() {
                            quantity--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove),
                    ),
                    Text(
                      '$quantity',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      for (int i = 0; i < quantity; i++) {
                        cartController.addToCart(dish);
                      }
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Successfully Added'),
                            content: Text(
                                '$quantity ${dish.label}(s) added to the cart.'),
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                    ),
                    child: const Text('+'),
                  );
                }),
              ],
            ),
            const SizedBox(height: 1),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  dish.text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  dish.pax,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  dish.price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

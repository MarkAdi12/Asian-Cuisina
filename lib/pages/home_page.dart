import 'package:carousel_slider/carousel_slider.dart';
import 'package:finals_project/models/cart_controller.dart';
import 'package:finals_project/models/home_model.dart';
import 'package:finals_project/pages/cart_page.dart';
import 'package:finals_project/pages/chinese_page.dart';
import 'package:finals_project/pages/filipino_page.dart';
import 'package:finals_project/pages/indian_page.dart';
import 'package:finals_project/pages/korean_page.dart';
import 'package:finals_project/pages/sides_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'japanese_page.dart';
import 'settings_page.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final cartController = Get.put(CartController());
  List<HomeTiles> hometiles = [
    HomeTiles(
      label: 'Filipino Cuisine',
      image: 'assets/hometile1.jpg',
      imagePath: 'path_to_chest_image',
      text: '4 Dishes Available',
    ),
    HomeTiles(
      label: 'Japanese Cuisine',
      image: 'assets/hometile2.jpg',
      imagePath: 'path_to_chest_image',
      text: '5 Dishes Available',
    ),
    HomeTiles(
      label: 'Chinese Cuisine',
      image: 'assets/hometile3.jpg',
      imagePath: 'path_to_chest_image',
      text: '3 Dishes Available',
    ),
    HomeTiles(
      label: 'Korean Cuisine',
      image: 'assets/hometile4.jpg',
      imagePath: 'path_to_chest_image',
      text: '4 Dishes Available',
    ),
    HomeTiles(
      label: 'Indian Cuisine',
      image: 'assets/hometile5.jpg',
      imagePath: 'path_to_chest_image',
      text: '3 Dishes Available',
    ),
    HomeTiles(
      label: 'Extras',
      image: 'assets/hometile6.jpg',
      imagePath: 'path_to_chest_image',
      text: '',
    ),
  ];

  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.restaurant_menu,
              color: Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              'Ordering Kiosk',
              textAlign: TextAlign.center,
              style: GoogleFonts.raleway(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20),
              child: Row(
                children: [
                  Center(
                    child: Container(
                      child: Text(
                        'Discover Asian Delights, \nOrder Now for a Tasty Adventure.',
                        style: GoogleFonts.raleway(
                          fontSize: 21,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ImageSlider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 20, 8, 8),
              child: Row(
                children: [
                  Text(
                    'Menu',
                    style: GoogleFonts.raleway(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            ...hometiles.map((hometile) {
              return InkWell(
                onTap: () {
                  if (hometile.label == 'Filipino Cuisine') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Filipino()),
                    );
                  } else if (hometile.label == 'Japanese Cuisine') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Japanese()),
                    );
                  } else if (hometile.label == 'Chinese Cuisine') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Chinese()),
                    );
                  } else if (hometile.label == 'Korean Cuisine') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Korean()),
                    );
                  } else if (hometile.label == 'Indian Cuisine') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Indian()),
                    );
                  } else if (hometile.label == 'Extras') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Sides()),
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 40, 24, 8),
                  height: 110,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(hometile.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          hometile.label,
                          style: GoogleFonts.raleway(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26),
                        ),
                      ),
                      Positioned(
                        top: 35,
                        left: 40,
                        child: Text(
                          hometile.text,
                          style: GoogleFonts.abel(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentindex,
        onTap: (value) {
          currentindex = value;
          if (currentindex == 1) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          } else if (currentindex == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Settings()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: 'Settings'),
        ],
        elevation: 0,
      ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> imageSlide = [
    'assets/adobo.jpg',
    'assets/japancurry.jpg',
    'assets/japanramen.jpg',
    'assets/chinesepork.jpg',
    'assets/japanudon.jpg',
    'assets/koreanbibimbap.webp',
    'assets/japantempura.png',
    'assets/indianchicken.jpg'
  ];

  ImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageSlide.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        final urlImage = imageSlide[index];
        return Container(
          width: 290,
          margin: const EdgeInsets.fromLTRB(0, 12, 0, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 200.0,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }
}

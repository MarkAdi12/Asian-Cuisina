import 'package:finals_project/pages/cart_page.dart';
import 'package:finals_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    int currentindex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          textAlign: TextAlign.center,
          style: GoogleFonts.raleway(
            fontSize: 21,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10, top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {},
              child: Row(
                children: [
                  const Icon(Icons.settings),
                  const SizedBox(width: 15),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'General',
                      style: GoogleFonts.raleway(
                        fontSize: 19,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 1),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'About Us',
                        style: GoogleFonts.raleway(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 1),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.import_contacts_outlined),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Terms and Conditions',
                        style: GoogleFonts.raleway(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 1),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.info),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Feedback',
                        style: GoogleFonts.raleway(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1, top: 1),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.language_outlined),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Language',
                        style: GoogleFonts.raleway(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
          if (currentindex == 0) {
            Navigator.pop(context,
                MaterialPageRoute(builder: (context) => const MyHome()));
          } else if (currentindex == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
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
        ],
        elevation: 0,
      ),
    );
  }
}

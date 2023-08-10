import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Authentication/sign_in.dart';

import '../commomwidgets/profile_widget.dart';
import '../colors/colors.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // void my_orders() {}
  // void my_address() {}
  // void terms_conditions() {}
  // void privacy_terms() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: black,
          title: Padding(
            padding: const EdgeInsets.only(left: 60.0),
            child: Text(
              'Account',
              style: GoogleFonts.junge(
                textStyle: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        body: Column(children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Icon(
                Icons.account_circle,
                color: Colors.black,
                size: 100,
              ),
            ),
          ),
          CustomElevatedButton(
            onPressed: () {},
            buttonText: 'My Address',
            iconData: Icons.home,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            onPressed: () {},
            buttonText: 'My Orders',
            iconData: Icons.shopping_basket,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Terms And Conditions',
            iconData: Icons.private_connectivity,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            onPressed: () {},
            buttonText: 'Privacy And Policy',
            iconData: Icons.privacy_tip,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Color.fromARGB(255, 19, 18, 12),
                width: 353,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        'LOGOUT',
                        style: GoogleFonts.junge(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      onTap: () {
                        FirebaseAuth.instance.signOut().then((value) {
                          print('signout');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      },
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.logout, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ]));
  }
}

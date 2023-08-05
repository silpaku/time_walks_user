import 'dart:developer';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:time_walks/Authentication/sign_up.dart';
import 'package:time_walks/colors/colors.dart';
import 'package:time_walks/commomwidgets/forgotwidget.dart';
import 'package:time_walks/commomwidgets/textfield.dart';
import 'package:time_walks/home/bottomnavigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigation()),
        );
      }).onError((error, stackTrace) {
        print('error');
      });
    } else {
      log('not validated');
    }
  }

  // @override
  // void dispose() {
  //   _usernameController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Text(
              'SIGN IN',
              style: GoogleFonts.junge(
                  textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 26,
              )),
            )),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                MyTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email address';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    hintText: 'Enter Email Address',
                    prefixIcon: Icons.email),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  obscureText: true,
                  keyboardType: TextInputType.name,
                  controller: _passwordController,
                  hintText: 'Enter Your Password',
                  prefixIcon: Icons.lock,
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForGotte()));
                },
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.junge(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: handleLogin,
              child: Text(
                'Login',
                style: GoogleFonts.junge(
                    textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 26,
                )),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(210, 48),
                // primary: Colors.white,
                fixedSize: const Size(140, 60),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Text(
              'or',
              style: GoogleFonts.junge(
                  textStyle: const TextStyle(color: Colors.grey, fontSize: 26)),
            ),
             Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          loginWithGoogle(context);
                        },
                        child:const Image(
                          image: AssetImage('assets/g.JPG'),
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Sign_up()));
              },
              child: Text('Donot have account? Sign up',
                  style: GoogleFonts.junge(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 10))),
            ),
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              'assets/w.JPG',
              height: 100,
              width: 350,
            )
          ],
        ),
      ),
    );
  }
}


loginWithGoogle(BuildContext context) async {
  try {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;

    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavigation(),
      ),
    );
  } catch (error) {
    print("Error during Google Sign-In: $error");
  }
}


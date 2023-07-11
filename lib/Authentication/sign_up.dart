import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/colors/colors.dart';
import 'package:time_walks/home/bottomnavigation.dart';

import '../commomwidgets/textfield.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
   final _formKey = GlobalKey<FormState>();

  void handleSignUp() {
   if(_formKey.currentState!.validate()){
     Navigator.push(context,
        MaterialPageRoute(builder: (context) => const BottomNavigation()));
   }else{
    log('not validated');
   }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
              'SIGN UP',
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
              child: Column(
                children: [
                  MyTextField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Please enter your username';
                      }else if(value.length<5){
                        return 'Username must be at least 6 characters';
                      }
                      return null;
                    },
                      keyboardType: TextInputType.name,
                      controller: _usernameController,
                      hintText: 'UserName',
                      prefixIcon: Icons.account_circle),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    validator: (value) {
                     if (value!.isEmpty) {
                    return 'Please enter your email address';
                  } else if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                    
                  },
                      controller: _email,
                        keyboardType: TextInputType.emailAddress,
                      hintText: 'Email Address',
                      prefixIcon: Icons.email),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    validator: (value) {
                      if(value!.isEmpty){
                        'Please enter your password';
                      }else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                    },
                      keyboardType: TextInputType.name,
                      controller: _passwordController,
                      hintText: 'Password',
                      prefixIcon: Icons.lock),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    validator: (value) {
                      if(value!.isEmpty){
                        'Please re-enter your password';
                      }else if(value != _passwordController.text){
                       return 'Password is not matching';
                      }
                      return null;
                    },
                      keyboardType: TextInputType.name,
                      controller: _confirmpassword,
                      hintText: 'Confirm Password',
                      prefixIcon: Icons.no_encryption),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            ElevatedButton(
              onPressed: handleSignUp,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 44),
                backgroundColor: Colors.white,
                fixedSize: const Size(140, 60),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text('Sign Up',
                  style: GoogleFonts.junge(
                      textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ))),
            ),
            Text('or',
                style: GoogleFonts.junge(
                    textStyle:
                        const TextStyle(color: Colors.grey, fontSize: 26))),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Image(
                        image: AssetImage('assets/g.JPG'),
                        height: 30,
                        width: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
            const  SizedBox(height: 40,),
            Image.asset('assets/w.JPG',height: 100,width: 350,) 
          ],
        ),
      ),
    );
  }
}

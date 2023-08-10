import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_walks/Authentication/sign_in.dart';
import 'package:time_walks/Authentication/sign_up.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  void handleLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>const LoginPage()), 
    );
  }
  void handleSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>const Sign_up()), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/p4.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: handleLogin,
                  child: Text(
                    'Login',
                    
                    style: GoogleFonts.junge(
                        textStyle:const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    )),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    // primary: Colors.white,
                    fixedSize: const Size(110, 50),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: handleSignUp,
                  child: Text('Sign Up',
                      style: GoogleFonts.junge(
                          textStyle:const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ))),
                      style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    // primary: Colors.white,
                    backgroundColor:const Color.fromRGBO(63, 60, 54, 1),
                    fixedSize: const Size(110, 50),
                    side: const BorderSide(
                      color: Colors.white,
                      width: 2.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

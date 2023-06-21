// import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:nepaltop/components/my_textfield.dart';
import 'package:nepaltop/pages/auth_page.dart';
// import 'package:nepaltop/home_page.dart';

import 'components/my_button.dart';
import 'components/square_tile.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  void Function()? onTap;

  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    //circulr progress indicator
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Invalid Username',
          ),
          backgroundColor: Colors.grey.shade100,
          shadowColor: Colors.black,
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Invalid Password',
          ),
          backgroundColor: Colors.grey.shade100,
          shadowColor: Colors.black,
        );
      },
    );
  }
//   Future<void> signInWiEGL_emulationthGoogle() async {
// // create instatnce of firebase auth and google singn in
//     FirebaseAuth auth = FirebaseAuth.instance;
//     final GoogleSignIn googleSignIn = GoogleSignIn();
// // trigger authencation
//     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//     // obtain the auth details from the request
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser!.authentication;
//     // create new  user credentials
//     final AuthCredential credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );
//     // sign in with user credinatls
//     final UserCredential userCredential =
//         await auth.signInWithCredential(credential);
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Welcome back you\'ve been missed!',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MyTextField(
                    controller: emailController,
                    hintText: 'UserName',
                    obsecureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    obsecureText: true,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Forgot Password?'),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  MyButton(
                    text: 'Sign in',
                    onTap: signUserIn,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        )),
                      ])),
                  const SizedBox(
                    height: 20,
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        imagePath: 'assets/image/google.png',
                      onTap: () => AuthPage(),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      SquareTile(imagePath: 'assets/image/apple.png', onTap: () => AuthPage(),),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Not a member?',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Register Now',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        )

//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: GestureDetector(
//             onTap: () async {
//              await  signInWithGoogle();
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => ProfilePage()));
//             },
//             child: Center(
//               child: Container(
//                 width: double.infinity,
//                 height: 40,
//                 decoration: BoxDecoration(
//                     border: Border.all(
//                       color: Colors.grey,
//                     ),
//                     borderRadius: BorderRadius.circular(9)),
//                 child: Row(children: [
//                   Image.asset('assets/image/google.png'),
//                   const Text('Continue with google ')
//                 ]),
//               ),
//             ),
//           ),
//         ),
        );
  }
}

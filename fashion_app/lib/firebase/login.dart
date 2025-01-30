import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';
import 'package:my_fashion_app/main.dart';
import 'package:my_fashion_app/screens/product_list_screen.dart';

import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _email = 'jeanmadrinenamulinde@gmail.com';
  final String _password = 'j3@n2004';
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/backk.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            constraints: BoxConstraints(
              maxWidth: 600.0,
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Color.fromARGB(248, 235, 77, 4),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'times new roman',
                            fontSize: 30),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    SizedBox(
                      height: 20.0,
                      child: Text(
                        'Welcome back! its good to see you again',
                        style: TextStyle(
                            color: Color.fromARGB(255, 17, 8, 1),
                            fontFamily: 'times new roman',
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(172, 2, 7, 8),
                        ),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color.fromARGB(248, 167, 53, 1),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 7, 3, 3),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 14, 6, 6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 7, 4, 4),
                          ),
                        ),
                      ),
                      style: TextStyle(
                        color: const Color.fromARGB(255, 248, 238, 238),
                      ),
                      cursorColor: const Color.fromARGB(255, 3, 1, 1),
                    ),
                    SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: const Color.fromARGB(255, 165, 36, 4),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 5, 5, 5),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 8, 7, 7),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 10, 6, 6),
                          ),
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color.fromARGB(172, 1, 12, 15),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color.fromARGB(255, 17, 12, 12),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      obscureText: _obscureText,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 8, 4, 4),
                      ),
                      cursorColor: const Color.fromARGB(255, 17, 13, 13),
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RichText(
                        text: TextSpan(
                          text: 'Forgot Password? ',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color.fromARGB(255, 209, 66, 9),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Forget Password'),
                                  backgroundColor:
                                      Color.fromARGB(255, 94, 255, 0),
                                ),
                              );
                            },
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(173, 173, 216, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 120.0,
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arimo'),
                      ),
                      onPressed: () {
                        if (_emailController.text == _email &&
                            _passwordController.text == _password) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Login in successfully as:$_email'),
                                actions: [
                                  TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductListScreen()),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Invalid email or password.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 20.0),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Or continue with',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 15, 7, 7),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.white,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login With Google ID'),
                                  backgroundColor:
                                      Color.fromARGB(255, 104, 99, 99),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/google.png',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 87, 29, 3),
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(25.0),
                            color: Color.fromARGB(255, 87, 29, 3),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Login With Apple ID'),
                                  backgroundColor:
                                      Color.fromARGB(255, 104, 99, 99),
                                ),
                              );
                            },
                            child: Image.asset(
                              'assets/apple.png',
                              height: 50.0,
                              width: 50.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    RichText(
                      text: TextSpan(
                        text: 'Not a member? ',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color.fromARGB(255, 8, 3, 3),
                        ),
                        children: [
                          TextSpan(
                            text: 'Register now',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 87, 29, 3),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(173, 173, 216, 230),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0,
                          horizontal: 50.0,
                        ),
                      ),
                      child: Text(
                        'Go to Home',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Arimo'),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

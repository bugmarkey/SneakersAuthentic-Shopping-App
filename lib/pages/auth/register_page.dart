import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterScreen({Key? key, required this.showLoginPage})
      : super(key: key);

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  //late String? _role = list.first;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  //List<String> list = <String>['VI', 'BSNL', 'AIRTEL'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    //_role = null;
    super.dispose();
  }

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    //add user details
    addUserDetails(_nameController.text.trim(), _emailController.text.trim(),
        int.parse(_phoneController.text.trim()));
    /*if (_role == 'VI') {
        addMobileNetworkVI(_role, int.parse(_phoneController.text.trim()));
      } else if (_role == 'BSNL') {
        addMobileNetworkBSNL(_role, int.parse(_phoneController.text.trim()));
      } else if (_role == 'AIRTEL') {
        addMobileNetworkAIRTEL(_role, int.parse(_phoneController.text.trim()));
      }*/
  }

  /*Future addMobileNetworkBSNL(String? role, int phone) async {
    await FirebaseFirestore.instance
        .collection('providers')
        .doc('bsnl')
        .update({
      'phone': FieldValue.arrayUnion([phone]),
    });
  }

  Future addMobileNetworkAIRTEL(String? role, int phone) async {
    await FirebaseFirestore.instance
        .collection('providers')
        .doc('airtel')
        .update({
      'phone': FieldValue.arrayUnion([phone]),
    });
  }

  Future addMobileNetworkVI(String? role, int phone) async {
    await FirebaseFirestore.instance.collection('providers').doc('vi').update({
      'phone': FieldValue.arrayUnion([phone]),
    });
  }*/

  Future addUserDetails(String firstName, String email, int phone) async {
    await FirebaseFirestore.instance.collection('users').add({
      'name': firstName,
      'email': email,
      'phone': phone,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Center(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/logo_plain.png',
                    height: 50,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Register.',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 70,
                      color: Colors.black,
                      fontFamily: 'Bebas',
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  //Name
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Phone
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        hintText: 'Mobile Number',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Email
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  //Password
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.key),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  //Signin
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => signUp(),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Provider Selection
                  /*Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: DropdownButton<String>(
                        value: _role,
                        icon: const Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(color: Colors.white),
                        onChanged: (String? newValue) {
                          setState(() {
                            _role = newValue;
                          });
                        },
                        items: list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),*/
                  //Login
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('I am already a member!!',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: widget.showLoginPage,
                        child: Text(' Login here',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.orange[900],
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
        ));
  }
}

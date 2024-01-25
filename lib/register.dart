import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _userDatabaseRef =
      FirebaseDatabase.instance.ref().child('users');
  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      String userId = userCredential.user?.uid ?? '';

      _userDatabaseRef.child(userId).set({
        'username': _usernameController.text,
        'email': _emailController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Succesfully Registered')));
      Navigator.pushNamed(context, '/login');
    } catch (e) {
      print("Error during registration: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Create an Account',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            buildTextFormField('Username', _usernameController),
            const SizedBox(height: 16),
            buildTextFormField('Email', _emailController),
            const SizedBox(height: 16),
            buildTextFormField('Password', _passwordController,
                isPassword: true),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Register'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ], // Add the missing closing parenthesis here
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

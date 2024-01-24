import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                  margin:
                      EdgeInsets.only(right: 16), // Adjust the margin as needed
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Register'),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(left: 16), // Adjust the margin as needed
                  child: ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            )
          ],
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

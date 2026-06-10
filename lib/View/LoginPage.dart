// ignore_for_file: body_might_complete_normally_nullable

import 'package:basicapp/Model/CustomTextFormFeild.dart';
import 'package:basicapp/Model/Validation.dart';
import 'package:basicapp/View/HomePage.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  Validation validation = Validation();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String _mail = "abc@gmail.com";
  final String _pass = "1234567890";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 60),
                Text("Welcome Back ", style: TextStyle(fontSize: 26)),
                SizedBox(height: 30),
                Customtextformfeild(
                  controller: _email,
                  hint: "abc@gmail.com",
                  label: "Email",
                  validator: (value) {
                    return validation.emailValidation(value);
                  },
                ),
                SizedBox(height: 16),
                Customtextformfeild(
                  controller: _password,
                  hint: "********",
                  label: "Password",
                  isPassword: true,
                  validator: (value) {
                    return validation.passwordValidation(value);
                  },
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_password.text == _pass && _email.text == _mail) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Login Succesfull Welcome Back"),
                            backgroundColor: Colors.greenAccent,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Invalid Email or Password!"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                    backgroundColor: Colors.lightBlueAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: Text("LOGIN", style: TextStyle(fontSize: 20)),
                ),
                TextButton(onPressed: () {}, child: Text("Forgot Password?")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

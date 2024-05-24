import 'package:flutter/material.dart';
import 'package:home_work_today/utils/extensions.dart';
import 'package:home_work_today/widgets/custom_form_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  String? email, password, phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Register",
        ),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomFormField(
                hintText: "Email",
                validator: (val) {
                  if (!val!.isValidEmail) {
                    return 'Enter a valid email.';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              CustomFormField(
                hintText: "Phone",
                validator: (val) {
                  if (!val!.isValidPhone) {
                    return 'Enter a valid phone number.';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    phone = val;
                  });
                },
              ),
              CustomFormField(
                hintText: "Password",
                obscureText: true,
                validator: (val) {
                  if (!val!.isValidPassword) {
                    return 'Enter a valid password.';
                  }
                  return null;
                },
                onSaved: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print("Form Data Validated & Saved!");
                    print("$email, $password, $phone");
                  }
                },
                child: const Text(
                  'Register',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

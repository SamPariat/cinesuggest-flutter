import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _registerFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imageWidth = MediaQuery.of(context).size.width * 0.5;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Image(
              image: const AssetImage('assets/images/login-3d.png'),
              width: imageWidth,
            ),
          ),
          const SizedBox(height: 10),
          Form(
            key: _registerFormKey,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  InputField(
                    controller: _emailController,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: ValidationBuilder()
                        .email('Email must be valid')
                        .build(),
                  ),
                  const SizedBox(height: 15),
                  InputField(
                    controller: _passwordController,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: ValidationBuilder()
                        .minLength(7, 'Password must be at least 7 characters')
                        .build(),
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value != _passwordController.text) {
                        return 'Confirmed password and password must match';
                      } else if (value.length < 7) {
                        return 'Confirmed password must be at least 7 characters';
                      }
                      return null;
                    },
                    isPassword: true,
                  ),
                  const SizedBox(height: 10),
                  InputField(
                    controller: _nameController,
                    hintText: 'Name',
                    keyboardType: TextInputType.text,
                    validator: ValidationBuilder()
                        .minLength(3, 'Name must be at least 3 characters')
                        .build(),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      bool isValid = _registerFormKey.currentState!.validate();

                      if (!isValid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Enter all fields')),
                        );
                        return;
                      }

                      await getIt<AuthAbstract>().signup(
                        _emailController.text,
                        _passwordController.text,
                        _nameController.text,
                      );

                      if (mounted) {
                        Navigator.of(context).pushReplacementNamed(
                          HomeScreen.routeName,
                        );
                      }
                    },
                    child: const Text('Register'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Already have an account? Swipe left.',
            style: TextStyle(color: primaryColor),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

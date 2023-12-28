import 'package:cinesuggest/api/api.dart';
import 'package:cinesuggest/constants/constants.dart';
import 'package:cinesuggest/screens/screens.dart';
import 'package:cinesuggest/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
            key: _loginFormKey,
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
                  ElevatedButton(
                    onPressed: () async {
                      bool isValid = _loginFormKey.currentState!.validate();

                      if (!isValid) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Enter all fields')),
                        );
                        return;
                      }

                      await getIt<AuthAbstract>().login(
                        _emailController.text,
                        _passwordController.text,
                      );

                      if (mounted) {
                        Navigator.of(context).pushReplacementNamed(
                          HomeScreen.routeName,
                        );
                      }
                    },
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Don\'t have an account? Swipe right.',
            style: TextStyle(color: primaryColor),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sx/provider/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginProvider _loginProvider = Provider.of<LoginProvider>(context);
    return Padding(
      padding: EdgeInsets.all(20),
      child: Scaffold(
        body: Column(
          children: [
            Center(
                child: Text(
              'Login Screen',
              style: TextStyle(
                fontSize: 19,
              ),
            )),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                _loginProvider.login(_emailController.text.toString(),
                    _passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: _loginProvider.loading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Center(
                        child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                      )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2_cli/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/Bg-LoginRegister.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 100.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/login-logo.png'),
                        scale: 1.70,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to Azalea',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Username Here...',
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Password',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password Here...',
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 12), // Padding tombol login
                            foregroundColor: Colors.white,
                            backgroundColor: Color.fromARGB(255, 190, 66, 149),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            if (controller.usernameController.text.isEmpty ||
                                controller.passwordController.text.isEmpty) {
                              Get.snackbar(
                                'Error',
                                'Username or password cannot be empty',
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 2),
                                margin: EdgeInsets.all(12),
                              );
                            } else {
                              controller.login(
                                controller.usernameController.text,
                                controller.passwordController.text,
                              );
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(fontSize: 12),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.REGISTER);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

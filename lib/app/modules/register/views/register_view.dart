import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_2_cli/app/routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    top: 100,
                  ),
                  child: const Text(
                    'Register Your Account',
                    style: TextStyle(
                      color: Color.fromARGB(255, 8, 9, 20),
                      fontWeight: FontWeight.w500,
                      fontSize: 30,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Username',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          controller: controller.usernameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Username Here',
                          ),
                        ),
                      ),
                      // Add text field for name
                      Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Name Here',
                          ),
                        ),
                      ),
                      // Add text field for address
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.addressController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Address Here',
                          ),
                        ),
                      ),
                      // Add text field for phone number
                      Text(
                        'Phone Number',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.phoneNumberController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Phone Number Here',
                          ),
                        ),
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Password Here',
                          ),
                        ),
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: TextField(
                          controller: controller.confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: 'Confirm Password Here',
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          height: 40,
                          padding: EdgeInsets.fromLTRB(10, 0, 16, 10),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  Color.fromARGB(255, 190, 66, 149),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text('Register'),
                            onPressed: () {
                              controller.register();
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(Routes.LOGIN);
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

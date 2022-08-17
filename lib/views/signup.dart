import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mazare3/views/farmer_or_customer_view.dart';
import 'login.dart';

class SignupView extends StatelessWidget {
  TextEditingController fNameCtrl = TextEditingController();
  TextEditingController lNameCtrl = TextEditingController();
  TextEditingController noCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => () {
                      Get.to(FarmerOrCustomerView());
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            child: SizedBox(
                              height: 37,
                              width: 37,
                              child: Center(
                                child: Icon(
                                  Icons.arrow_back,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  const Text(
                    'Signup',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Sign up with one of the following options.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                'OR',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.teal[300],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.teal[300],
                      onSurface: Colors.teal[300],
                    ),
                    onPressed: () {
                      Get.to(LoginView());
                    },
                    child: const Text('log in?'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              buildMyField(
                'Enter your first name',
                fNameCtrl,
                const Icon(Icons.face),
                false,
              ),
              const SizedBox(height: 8),
              buildMyField(
                'Enter your last name',
                lNameCtrl,
                const Icon(Icons.face),
                false,
              ),
              const SizedBox(height: 8),
              buildMyField(
                'Enter your phone number',
                noCtrl,
                const Icon(Icons.phone),
                false,
              ),
              const SizedBox(height: 8),
              buildMyField(
                'Example@gmail.com',
                emailCtrl,
                const Icon(Icons.email),
                false,
              ),
              const SizedBox(height: 8),
              buildMyField(
                'Pick a strong password',
                passCtrl,
                const Icon(Icons.security),
                true,
              ),
              const SizedBox(height: 18),
              MaterialButton(
                  minWidth: 800,
                  height: 50,
                  color: Colors.teal.shade300,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: const Text(
                    ' Create Account ',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
/*
  @override
  void dispose() {
    super.dispose();
    fNameCtrl.dispose();
    lNameCtrl.dispose();
    noCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
  }
  */

  buildMyField(
      String label, TextEditingController textCtrl, Icon myIcon, bool secure) {
    return TextField(
      controller: textCtrl,
      decoration: InputDecoration(
        prefixIcon: myIcon,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      obscureText: secure,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'farmer_or_customer_view.dart';
import 'signup.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
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
                  'Login',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            buildMyField(
              'Example@gmail.com',
              emailCtrl,
              const Icon(Icons.email),
              false,
            ),
            const SizedBox(height: 12),
            buildMyField(
              'Password',
              passCtrl,
              const Icon(Icons.security),
              true,
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.grey,
                onSurface: Colors.black,
              ),
              onPressed: () {},
              child: const Text('forgot your password?'),
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
                minWidth: 800,
                height: 50,
                color: Colors.teal.shade300,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: const Text(
                  ' Log in ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {}),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Log in with one of the following options.',
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
                  'Do not have an account?',
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
                    Get.to(SignupView());
                  },
                  child: const Text('sign up?'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
  @override
  void dispose() {
    super.dispose();
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

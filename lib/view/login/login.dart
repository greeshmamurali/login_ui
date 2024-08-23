import 'package:flutter/material.dart';
import 'package:login_ui/view/homescreen/homescreen.dart';
import 'package:login_ui/view/registration/registration.dart';


class Login extends StatefulWidget {
  final String email;
  final String password;
  const Login({super.key, required this.email, required this.password});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _registeremail = TextEditingController();
  TextEditingController _registerpass = TextEditingController();
  bool visible = false;

  final loginkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Sign in to Your Account',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Form(
              key: loginkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _registeremail,
                    decoration: InputDecoration(
                        hintText: 'Your Email Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey))),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: !visible,
                    controller: _registerpass,
                    decoration: InputDecoration(
                        hintText: 'Your Password',
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visible = !visible;
                            });
                          },
                          icon: Icon(
                            visible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey))),
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Enter a valid password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check_box_outlined,
                      color: Colors.grey,
                      size: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                          color: Color.fromARGB(255, 85, 82, 82),
                          //fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (loginkey.currentState!.validate()) {
                  if (_registeremail.text == widget.email &&
                      _registerpass.text == widget.password) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Homescreen(),
                        ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Wrong Credentials')));
                  }
                }
              },
              child: Text(
                'Sign in',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 19, 130, 221)),
                  minimumSize:
                      WidgetStatePropertyAll(Size(double.infinity, 70)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Registration(),
                      )),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

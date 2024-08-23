import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_ui/view/login/login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _LoginState();
}

class _LoginState extends State<Registration> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmpass = TextEditingController();
  bool visible = false;
  String email = '';
  String pass = '';

  final _formkey = GlobalKey<FormState>();

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
                'Sign Up for Free',
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
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        hintText: 'Your Email Address',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.grey))),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Enter a valid email-id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: !visible,
                    controller: _pass,
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
                  //column

                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    obscureText: !visible,
                    controller: _confirmpass,
                    decoration: InputDecoration(
                        hintText: 'Your Confirm Password',
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
                      if (value == null || value != _pass.text) {
                        return 'Incorrect Password';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    email = _email.text;
                    pass = _pass.text;
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Account Created Successfully')));
                  });
                }
                
              },
              child: Text(
                'Sign up',
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
                  "Already have an account?",
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(
                          email: email,
                          password: pass,
                        ),
                      )),
                  child: Text(
                    'Sign in',
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

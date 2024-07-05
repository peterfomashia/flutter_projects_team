import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/Home.dart';
import 'package:learning_app/fitur/login_and_regist/auth_prov.dart';
import 'package:learning_app/fitur/login_and_regist/register.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool isError = false;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).loadRegisterInfo();
    Provider.of<AuthProvider>(context, listen: false).loadLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 80,
                ),
                radius: 70,
              ),
              SizedBox(height: 40),
              TextField(
                controller: email,
                onChanged: (val) => {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  })
                },
                decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlue, width: 2))),
              ),
              SizedBox(height: 30),
              TextField(
                controller: pass,
                onChanged: (val) {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  errorText: isError ? "Invalid email or password" : null,
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Lupa Password ?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: isVisible,
                child: Text(
                  "Email atau Password Kosong !",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (email.text.isEmpty || pass.text.isEmpty) {
                      isVisible = true;
                    } else if (authProvider.validateCredentials(email.text, pass.text)) {
                      authProvider.saveLoginStatus(true);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Home()));
                    } else {
                      isError = true;
                      email.text = "";
                      pass.text = "";
                    }
                  });
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(400, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "Belum punya akun ? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                              text: "Register !",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Register()))
                                }),
                        ])),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

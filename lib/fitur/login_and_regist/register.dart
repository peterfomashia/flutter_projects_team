import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/fitur/login_and_regist/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passrepeat = TextEditingController();

  bool isError = false;
  bool isVisible = false;
  bool isSame = false;
  @override
  Widget build(BuildContext context) {
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
                  Icons.app_registration,
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
                ),
                obscureText: true,
              ),
              SizedBox(height: 30),
              TextField(
                controller: passrepeat,
                onChanged: (val) {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Ulangi Password",
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                  visible: isVisible,
                  child: Text(
                    "Salahsatu tidak boleh ada yang kosong !",
                    style: TextStyle(color: Colors.red),
                  )),
              Visibility(
                  visible: isSame,
                  child: Text(
                    "Password harus sama !",
                    style: TextStyle(color: Colors.red),
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (email.text.isEmpty |
                    pass.text.isEmpty |
                    passrepeat.text.isEmpty) {
                      isVisible = true;
                      isError = true;
                    } else if (pass.text != passrepeat.text) {
                      isSame = true;
                      isError = true;
                    } else {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Login()));
                    }
                  });
                },
                child: Text(
                  "Register",
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
                            text: "Sudah punya akun ? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                              text: "Login !",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Login()))
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

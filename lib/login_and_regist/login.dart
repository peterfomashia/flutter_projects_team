import 'package:flutter/material.dart';

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
                  Icons.book_outlined,
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
                    labelText: 'email',
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
                  errorText: isError ? "Wrong password" : null,
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
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
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
                      ),
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

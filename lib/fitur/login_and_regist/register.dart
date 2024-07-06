import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/fitur/login_and_regist/auth_prov.dart';
import 'package:learning_app/fitur/login_and_regist/login.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passrepeat = TextEditingController();
  TextEditingController dobController = TextEditingController();

  bool isError = false;
  bool isVisible = false;
  bool isSame = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 70,
                child: Icon(
                  Icons.app_registration,
                  color: Colors.white,
                  size: 80,
                ),
              ),
              const SizedBox(height: 40),
              TextField(
                controller: email,
                onChanged: (val) => {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  })
                },
                decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.lightBlue, width: 2))),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: pass,
                onChanged: (val) {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  });
                },
                decoration: const InputDecoration(
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
              const SizedBox(height: 30),
              TextField(
                controller: passrepeat,
                onChanged: (val) {
                  setState(() {
                    isError = false;
                    isVisible = false;
                  });
                },
                decoration: const InputDecoration(
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
              const SizedBox(height: 30),
              TextField(
                controller: dobController,
                readOnly: true,
                onTap: () => _selectDate(context),
                decoration: const InputDecoration(
                  labelText: "Tanggal Lahir",
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2)),
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                  visible: isVisible,
                  child: const Text(
                    "Salah satu tidak boleh ada yang kosong !",
                    style: TextStyle(color: Colors.red),
                  )),
              Visibility(
                  visible: isSame,
                  child: const Text(
                    "Password harus sama !",
                    style: TextStyle(color: Colors.red),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (email.text.isEmpty ||
                        pass.text.isEmpty ||
                        passrepeat.text.isEmpty ||
                        dobController.text.isEmpty) {
                      isVisible = true;
                      isError = true;
                    } else if (pass.text != passrepeat.text) {
                      isSame = true;
                      isError = true;
                    } else {
                      Provider.of<AuthProvider>(context, listen: false)
                          .saveRegisterInfo(email.text, pass.text);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const Login()));
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 50),
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue),
                child: const Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: RichText(
                        text: TextSpan(children: [
                          const TextSpan(
                            text: "Sudah punya akun ? ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                              text: "Login !",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => const Login()));
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

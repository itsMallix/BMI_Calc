import 'package:flutter/material.dart';
import 'home.dart';
import 'db.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formState = GlobalKey<FormState>();
  final _unameController = TextEditingController();
  //################################################//
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[200],
        body: Container(
          margin: EdgeInsets.all(15),
          child: Form(
            key: _formState,
            child: Column(
              children: <Widget>[
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0x0ff8653F7),
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Masuk untuk melihat lebih',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0x0ff8653F7),
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (uname) {
                    if (uname == '') {
                      return 'Username Tidak Boleh Kosong';
                    } else if (uname != user_username) {
                      return "Masukkan Username dengan Benar";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Username'),
                    suffixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (passwd) {
                    if (passwd == '') {
                      return 'Password Tidak Boleh Kosong';
                    } else if (passwd != user_password) {
                      return 'Masukkan  Password dengan Benar';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.lock),
                    label: Text('Password'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formState.currentState!.validate()) {
                        //Do
                        Navigator.pushNamed(context, '|goTo_home');
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x0ffF86366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Submit'),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Belum Punya Akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '|goTo_register');
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Color(0x0ff8653F7),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

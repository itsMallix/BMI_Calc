import 'package:flutter/material.dart';
import 'db.dart';

class registerPage extends StatefulWidget {
  const registerPage({super.key});

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
  final _formState = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
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
                  'REGISTER',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0x0ff8653F7),
                    letterSpacing: 2.0,
                  ),
                ),
                Text(
                  'Daftar untuk melihat lebih',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color(0x0ff8653F7),
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  onChanged: (val) {
                    user_username = val;
                  },
                  validator: (uname) {
                    if (uname == '') {
                      return 'Username Tidak Boleh Kosong';
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
                  controller: passController,
                  onChanged: (val) {
                    user_password = val;
                  },
                  validator: (passwd) {
                    if (passwd == '') {
                      return 'Password Tidak Boleh Kosong';
                    } else {
                      return null;
                    }
                    // else {
                    //   return 'Data berhasil didaftarkan, password : $nilai2';
                    // }
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
                        nameController.clear();
                        passController.clear();
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: Text(
                                      'your username : $user_username\nyour password : $user_password'),
                                ));
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
                    Text('Sudah Punya Akun?'),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '|goTo_login');
                      },
                      child: Text(
                        'Login',
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

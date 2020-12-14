import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vize/anaSayfa.dart';
import 'package:vize/sifremiUnuttum.dart';
import 'package:vize/uyeOl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String demo;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: girisSayfa(),
      initialRoute: '/',
    );
  }
}

class girisSayfa extends StatelessWidget {
  String username;
  String password;
  final _formKey = GlobalKey<FormState>();

  girisSayfa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "Kullanıcı Adı",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Kullanıcı Adı Girmelisiniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  username = value;
                },
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "Şifre",
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Şifrenizi Girmelisiniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                      child: Text(
                        "Üye Ol",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => uyeOl()));
                      }),
                  MaterialButton(
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => sifremiUnuttum()));
                    },
                  )
                ],
              ),
              RaisedButton(
                color: Colors.orange,
                child: Text("Giriş Yap"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    if (username == "demo" && password == "demo") {
                      debugPrint("Giriş Başarılı");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => anaSayfa(),
                          ));
                    } else {
                      debugPrint("Hatalı Giriş yapıldı");
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Hatalı Giriş Yaptınız"),
                            );
                          });
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

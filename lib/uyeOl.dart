import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vize/main.dart';

class uyeOl extends StatefulWidget {
  uyeOl({Key key}) : super(key: key);

  @override
  _uyeOlState createState() => _uyeOlState();
}

class _uyeOlState extends State<uyeOl> {
  String email;
  String sifre;
  final parolaEsitController = TextEditingController();
  final parolaController = TextEditingController();
  final emailController = TextEditingController();
  final usernameController = TextEditingController();

  final _sckey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final snackBar = SnackBar(
      content: Text(
    "Parola Tekrarını Doğru Giriniz",
    style: TextStyle(color: Colors.red),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sckey,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(23),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 32,
                        bottom: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22))),
                        controller: emailController,
                      )),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 12,
                        bottom: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Kullanıcı Adı",
                            prefixIcon: Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22))),
                        controller: usernameController,
                      )),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 12,
                        bottom: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Şifre",
                            prefixIcon: Icon(Icons.lock_open),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22))),
                        controller: parolaController,
                      )),
                  SizedBox(
                    height: 17,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width / 2.2,
                      margin: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 12,
                        bottom: 12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: "Şifre Tekrarı",
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(22))),
                        controller: parolaEsitController,
                      )),
                  SizedBox(
                    height: 17,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 32, right: 32, top: 15, bottom: 15),
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Text("Kayıt oL"),
                      onPressed: () {
                        email = emailController.text;
                        sifre = parolaController.text;
                        if (parolaController.text ==
                            parolaEsitController.text) {
                          _auth
                              .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: parolaController.text)
                              .catchError(
                                  (hata) => debugPrint(hata.toString()));
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => girisSayfa()),
                          );
                          debugPrint(
                              email.toString() + "şifre:" + sifre.toString());
                        } else {
                          _sckey.currentState.showSnackBar(SnackBar(
                            content: Text("Parola Tekrarı Yanlış Girildi"),
                            duration: Duration(seconds: 2),
                            action: SnackBarAction(
                              label: "Gizle",
                              onPressed: () {},
                            ),
                          ));
                        }
                      },
                    ),
                  ),
                  RaisedButton(
                      color: Colors.orange[300],
                      child: Text(
                        "Vazgeç",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => girisSayfa()),
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

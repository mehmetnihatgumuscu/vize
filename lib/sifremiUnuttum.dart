import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vize/main.dart';
import 'package:vize/uyeOl.dart';

class sifremiUnuttum extends StatelessWidget {
  final emailController = TextEditingController();

  String email;

  sifremiUnuttum({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  "Şifre Sıfırlama Ekranı",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                margin: EdgeInsets.all(18),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                margin: EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      labelText: "email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                  color: Colors.red,
                  child: Text("Gönder"),
                  onPressed: () {
                    email = emailController.text;
                    debugPrint(email.toString() +
                        " - Email Adresine Şifre Sıfırlama Gönderildi!");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => girisSayfa(),
                        ));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

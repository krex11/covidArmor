import 'package:flutter/material.dart';
import 'package:mini/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

//textfield state
final List<String> de = ['A+', 'B+', 'AB+', 'O+', 'A-', 'B-', 'AB-', 'O-'];
String email = '';
String password = '';
String error = '';
String name;
String ad;
String ph;
String bg;

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Register',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text.rich(TextSpan(children: <TextSpan>[
                      TextSpan(text: 'Covid', style: TextStyle(fontSize: 40)),
                      TextSpan(
                          text: 'Armor',
                          style: TextStyle(
                            fontSize: 55,
                          ))
                    ])),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Email'),
                      validator: (val) => val.isEmpty ? 'enter email ' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Password'),
                      obscureText: true,
                      validator: (val) => val.length < 8
                          ? 'Enter password 8 charecter long minimum'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Name'),
                      validator: (val) => val.isEmpty ? 'enter ' : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'Address'),
                      validator: (val) => val.isEmpty ? 'enter ' : null,
                      onChanged: (val) {
                        setState(() => ad = val);
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: 'phone'),
                      validator: (val) => val.isEmpty ? 'enter ' : null,
                      onChanged: (val) {
                        setState(() => ph = val);
                      },
                    ),
                    DropdownButtonFormField(
                      items: de.map((dep) {
                        return DropdownMenuItem(
                          value: dep,
                          child: Text('$dep'),
                        );
                      }).toList(),
                      validator: (val) => val.isEmpty ? 'please select' : null,
                      onChanged: (val) => setState(() => bg = val),
                    ),
                    ElevatedButton(
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepOrange),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email, password, name, email, ad, ph, bg);
                          if (result == null) {
                            setState(
                                () => error = 'please supply a valid email');
                          }
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                        onPressed: () {
                          widget.toggleView();
                        },
                        child: Text('SignIn Here'))
                  ],
                ))),
      ),
    );
  }
}

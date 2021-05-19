import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../services/auth.dart';

class SignIn extends StatefulWidget {
  

  final Function toggleView;
  SignIn({ this.toggleView });


  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();


  //textfield state
  
  String email = '';
  String password = '';
  String error ="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children:<Widget> [
                Text("Sign In",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Covid',style: TextStyle(fontSize: 40)),
                      TextSpan(text: 'Armor',style: TextStyle(fontSize: 55,))

                    ]
                  )
                ),

                SizedBox(height: 70,),
                TextFormField(
                  
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)
                    ),
                    hintText: 'Email'
                  ),
                  validator: (val) => val.isEmpty ? 'enter email ' : null,
                  onChanged: (val){
                    setState(()=> email=val);
                  },
                ),
                 SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(100)),
                    hintText: 'Password'
                  ),
                  obscureText: true,
                  validator: (val) => val.length < 8 ? 'Enter password 8 charecter' : null,
                  onChanged: (val){
                    //setState(()=> email = val);
                    setState(()=> password=val );

                  },
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  child: Text('LogIn',style: TextStyle(color: Colors.white),),
                  style:ElevatedButton.styleFrom(
                    primary: Colors.deepOrange
                  ),
                  onPressed: () async{
                    if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                      if(result == null) {
                      setState(() => error = 'Invalid Credentials');

                      }
                  }

                  },
                ),
                SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              ),
               
                TextButton(
                  onPressed: (){
                     widget.toggleView();
                  }, 
                child: Text('Register here')
                
                )
              ],
            )
            )
          
        ),
      ),
    );
  }
}
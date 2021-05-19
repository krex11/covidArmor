import 'package:flutter/material.dart';

import '../../services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  
  
  @override
  _RegisterState createState() => _RegisterState();
}

final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();


  //textfield state
  
  String email = '';
  String password = '';
  String error ='';


class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Register'),
      ),
      body: Container(
        padding:  EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children:<Widget> [
            Text("Register",style: TextStyle(color: Colors.red,fontSize: 30,fontWeight: FontWeight.bold),),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(text: 'Covid',style: TextStyle(fontSize: 40,color: Colors.black38)),
                      TextSpan(text: 'Armor',style: TextStyle(fontSize: 55,))

                    ]
                  )
                ),
              SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                    hintText: 'Email'
                  ),
                validator: (val) => val.isEmpty ? 'enter email ' : null,
                onChanged: (val){
                  setState(() => email=val);
                },
              ),
               SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder( borderRadius: BorderRadius.circular(20)),
                    hintText: 'Password'
                  ),
                obscureText: true,
                 validator: (val) => val.length < 8 ? 'Enter password 8 charecter long minimum' : null,
                onChanged: (val){
                  setState(()=> password = val);
                 

                },
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                child: Text('Register',style: TextStyle(color: Colors.white),),
                style:ElevatedButton.styleFrom(
                  primary: Colors.deepOrange
                ),
                onPressed: () async{                 
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                    if(result==null){
                      setState(()=> error ='please supply a valid email');
                    }
                    
                  }

                },
              ),
              SizedBox(height: 10,),
              Text(error,
              style: TextStyle(color: Colors.red,fontSize: 14.0),
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){
                  widget.toggleView();
                }, 
              child: Text('SignIn Here')
              
              )
            ],
          )
          )
        
      ),
    );
  }
}
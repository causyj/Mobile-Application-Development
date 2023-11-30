import 'package:flutter/material.dart';
import 'package:video2/ChatPage.dart';
import 'package:video2/RegisterPage.dart';
import 'RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Login'),
    ),
      body: LoginForm() ,
    );
  }
}
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    bool saving = false;
    return ModalProgressHUD(
      inAsyncCall : saving,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child : ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (value){
                  email = value;

                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText:  true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                onChanged: (value){
                  password = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: () async{
                try{
                  setState(() {
                    saving = true;
                  });
                  final currentUser = await _authentication.signInWithEmailAndPassword(email: email, password: password);
                  if(currentUser.user != null ) {
                    _formKey.currentState!.reset();
                    if (!mounted) return;

                  }
                  setState(() {
                    saving = false;
                  });
                }catch(e){
                    print(e);
               }

                },
              child: Text('Enter')),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('If you did not register,'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                  }, child: Text('Register your email')),
                ],
              )
            ],
          )
        ),
      ),
    );
  }
}


    
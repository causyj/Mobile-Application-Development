import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video2/SuccessRegister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
 class RegisterPage extends StatelessWidget {
   const RegisterPage({super.key});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('Register'),
       ),
       body: RegisterForm(),
     );
   }
 }
 class RegisterForm extends StatefulWidget {
   const RegisterForm({super.key});

   @override
   State<RegisterForm> createState() => _RegisterFormState();
 }

class _RegisterFormState extends State<RegisterForm> {
   final _authentication = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
   String userName = '';
   bool saving = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: saving,
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
                  obscureText: true,
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
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                  onChanged: (value){
                    userName = value;
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
                    final newUser = await _authentication.createUserWithEmailAndPassword(
                        email: email, password: password);
                    await FirebaseFirestore.instance.collection('user').doc(newUser.user!.uid).set({
                      'userName' : userName,
                      'email' : email,
                    });
                    if(newUser.user != null){
                      _formKey.currentState!.reset();
                      if(!mounted) return;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SuccessRegister()));
                      setState(() {
                        saving = false;
                      });
                    }
                  }
                  catch(e){
                    print(e);
                  }

                }, child: Text('Enter')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('If you already registered'),
                    TextButton(onPressed: (){
                      Navigator.pop((context));
                    }, child: Text('log in in with your email')),
                  ],
                )
              ],
            )
        ),
      ),
    );
  }
}




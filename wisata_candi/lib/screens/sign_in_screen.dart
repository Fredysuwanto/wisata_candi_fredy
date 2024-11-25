import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
   SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //TODO 1 = Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorText = '';
  bool _isSignedIn = false;
  bool _obscurePassword =true;

  void _signIn() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String savedUsername = prefs.getString('username')?? '';
    final String savedPassword = prefs.getString('password')?? '';
    final String enteredUsername = _usernameController.text.trim();
    final String enteredPassword = _passwordController.text.trim();

    if(enteredUsername.isEmpty || enteredPassword.isEmpty){
      setState(() {
        _errorText ='nama pengguna ';
      });
      return;
    }
    if(enteredUsername.isEmpty || enteredPassword.isEmpty){
      setState(() {
        _errorText ='nama pengguna ';
      });
      return;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO 2 = Pasang app bar
      appBar: AppBar(title: Text("Sign in"),),
      //TODO 3 = pasang body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  //TODO 4 = Atur mainAxisAlignment dan crossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  //TODO 5 = Pasang TextFormField nama Pengguna
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Nama Pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    //TODO 6 = pasang textFormField Kata Sandi
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        errorText: _errorText.isNotEmpty ? _errorText: null ,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                            onPressed: (){
                              setState(() {
                                  _obscurePassword = !_obscurePassword;
                              });
                            },
                            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility,),),
                    ),
                    obscureText: _obscurePassword,
                    ),
                    //TODO 7 = Pasang elevated button sign in
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: (){}, child: Text("Sign In")),
                    //TODO 8 = Pasang TextButton Sign Up
                    SizedBox(height: 10),
                    // TextButton(onPressed: (){}, child: Text("Belum Punya Akun? Daftar di sini")),
                    RichText(text: TextSpan(
                      text: "Belum Punya Akun ?",
                      style: TextStyle(fontSize: 16, color: Colors.deepPurple),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Daftar di Sini',
                          style: TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            fontSize: 16
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap =(){
                            Navigator.pushNamed(context, '/signup');
                            },
                        ),
                      ],
                    ),),
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }
}

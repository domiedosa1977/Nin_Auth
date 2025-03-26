
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nin__page/features/user_auth/presentation/pages/login_page.dart';
import 'package:nin__page/features/user_auth/presentation/widgets/form_container_widget.dart';

import '../../firebase_auth_implementation/firebase_auth_services.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _signUp() async{
    String Username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;


    if(Username.isEmpty ||email.isEmpty||password.isEmpty){
      _showSnackbar("Please fill all the fields",Colors.red);
      return;
    }
    try{
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if(user != null){
      _showSnackbar("user is successfully created",Colors.green);
      Future.delayed(Duration(seconds: 2),(){
        Navigator.pushNamed(context, "/login");
          });
    }else{
      _showSnackbar("Some Error Happened",Colors.red);
    }
  }catch(e){
      _showSnackbar("Error: ${e.toString()}",Colors.red);
    }
  }

  void _showSnackbar(String message,Color color){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }


  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Image.asset(
                  width: 70,
                  "images/Screenshot_2025-03-13_165831-removebg-preview (1).png"),
            ),
            Text("SignUp",style: TextStyle(fontSize: 17,fontWeight:FontWeight.bold),)
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Text("National Identification Management Comission",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.green[900],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: Text("-providing assured identity ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.green[900],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 20,left: 20),
                child: FormContainerWidget(
                  controller: _usernameController,
                  hintText: "UserName",
                  isPasswordField: false,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 10.0,right: 20,left: 20),
                child: FormContainerWidget(
                  controller: _emailController,
                  hintText: "Email",
                  isPasswordField: false,
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(top: 5.0,right: 20,left: 20),
                child: FormContainerWidget(
                  controller: _passwordController,
                  hintText: "Password",
                  isPasswordField: true,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap:_signUp,
                child: Container(
                  width: 250,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text("Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have An Account?"),
                  SizedBox(width: 5,),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()),(route)=>false);
                    },
                    child: Text("Login",style: TextStyle(color: Colors.green),
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

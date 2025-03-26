import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nin__page/features/user_auth/presentation/widgets/form_container_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Welcome"),
            SizedBox(width: 75,),
            IconButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, "/login");
            }, icon: Icon(Icons.logout_outlined))
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0,left: 30,right: 20),
            child: Text("Welcome to NIMC page",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green[900],
            ),),
          ),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 30.0,right: 30),
            child: FormContainerWidget(
              hintText: "Enter your NIN",
              isPasswordField: false,
            ),
          )
        ],
      ),
    );
  }
}

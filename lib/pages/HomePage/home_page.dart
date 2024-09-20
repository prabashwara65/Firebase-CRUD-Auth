import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_crud/pages/Preferences/preference_page.dart';
import 'package:flutter_crud/pages/authFile/auth.dart';


class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);

  final User? user = Auth().CurrentUser; 

  Future<void> signOut() async {
  await Auth().signOut();
  }

  Widget _userUid() {
    return Text(user?.email?? "User email");
  }

  Widget _signOutButton(){
    return ElevatedButton(
      onPressed: signOut, 
      child: const Text("Sign out")
      );
  }


  //Button for navigate to home
  Widget _goToHomePageButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserPreferencePage()),
        );
      },
      child: const Text("Home"),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hi this is title'), //_title()
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _userUid(),
            _signOutButton(),
            _goToHomePageButton(context),
          ],
        ),
      ),
    );
  }
}
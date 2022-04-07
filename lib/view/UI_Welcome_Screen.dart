import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taniku/view/loginfix.dart';
import 'package:taniku/view/registerfix.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/umb.png", width: 100, height: 100,),
            const SizedBox(height: 22,),
            const Text("Daftar segera PMB Mercu Buana", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
          Column(
            children: [
              const SizedBox(height: 100,),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegistScreen()));
                  },
                child: Text("sign up"),
                  ),
              const SizedBox(height: 10,),
              OutlinedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFix()));
              }, child: Text("Sign In"),
                style: OutlinedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: StadiumBorder(),
                  shadowColor: Colors.white70,
                ),
              ),
              SizedBox(height: 100,),
              const Text("Skip For Now", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),),
            ],

      )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_basic_1/screens/list2_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future setLoin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogin', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('로그인'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.85,
          child: ElevatedButton(
            onPressed: () {
              setLoin().then((_) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ListScreen()));
              });
            },
            child: const Text('로그인'),
          ),
        ),
      ),
    );
  }
}
/*

      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(),) Text('ListScreen')),
    );
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      )
      */
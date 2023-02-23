import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:Player/Playerclass.dart' as Audios;
import 'package:Player/Gospel_class.dart' as gospel;
import 'package:All_audio/All_audioclass.dart' as _audioScreen;
import 'package:Trending/Trendingclass.dart' as  trendingScreen;
import 'package:Videos/Videosclass.dart' as videoScreen;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: WelcomeScreen(),
    );
  }
}


class WelcomeScreen{
     @override
widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Musikpod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
               style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Register",
                style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Stream and Download Latest Songs MP3/MP4 Uploads",
               style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),

      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All Audios",
              style: TextStyle(fontSize: 24),
                        ),  
           onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => audioScreen()),
                );
             
 }
            SizedBox(height: 20),
            Text(
              "Trending Songs",
              style: TextStyle(fontSize: 24),
            ),   onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => trendingScreen()),
                );
             
 }
     
            SizedBox(height: 20),
            Text(
              "Videos",
              style: TextStyle(fontSize: 24),
            ),onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => videoScreen()),
                );
             
 }
     
              Text(
              "Trending Videos",
              style: TextStyle(fontSize: 24),
            ),   onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _trendingvideoscreen()),
                );
           
 }
     
          ],
        ),
       
    );
  }
}

class LoginScreen extends StatelessWidget {

   String errorMessage = '';

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    Map<String, String> data = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      Uri.parse('https://musikpod.com.ng/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
 if (response.statusCode == 200) {
  
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      setState(() {
        errorMessage = 'Invalid email or password';
      });
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ), 
      body: Container(
          color: Colors.#307D7E,
          padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              controller: emailController, 
     
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
               controller:passwordController,
                      
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
            login();

 },
              child: Text('Login'),
            ),
            SizedBox(height: 16),
            TextButton(
             
             
              child: Text('Don\'t have an account? Register here.'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Perform registration action
              },
              child: Text('Register'),
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Already have an account? Login here.'),
            ),
          ],
        ),
      ),
    );
  }
}
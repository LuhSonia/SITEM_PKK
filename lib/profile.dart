import 'package:flutter/material.dart';
import 'package:kebaya_boutiq/home_page.dart';
// import 'package:kebaya_boutiq/pages/edit_profile.dart';

import 'edit_profile.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.pink,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(
                    'assets/logo google.png'), // Pastikan path gambar benar
                radius: 70.0,
              ),
              SizedBox(height: 20.0),
              Text(
                'Ni Made Budi Ayu',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'budiayu123@gmail.com',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyEdit(),
                    ),
                  );
                },
                child: Text('Edit Profil'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

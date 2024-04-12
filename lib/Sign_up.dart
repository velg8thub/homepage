import 'package:flutter/material.dart';

class SignUpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Fill in your details below'),
            SizedBox(height: 20),
            Text('First Name'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your first name',
              ),
            ),
            SizedBox(height: 10),
            Text('Last Name'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your last name',
              ),
            ),
            SizedBox(height: 10),
            Text('Username'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            SizedBox(height: 10),
            Text('Password'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            SizedBox(height: 10),
            Text('Confirm Password'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Confirm your password',
              ),
            ),
            SizedBox(height: 10),
            Text('Your ID number can be found on your issued ID.'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your employee ID',
              ),
            ),
            SizedBox(height: 10),
            Text('Staff ID#'),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your staff ID',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add sign-up logic here
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
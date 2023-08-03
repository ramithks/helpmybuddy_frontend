import 'package:flutter/material.dart';
import 'package:helpmybuddy_frontend/global_index.dart';

class TestFetch extends StatelessWidget {
  final GoogleSignInAccount user;

  const TestFetch({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logged In"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              GoogleSignInApi.logout();
              Navigator.pushNamed(context, RoutePaths.loginRoute);
            },
            child: const Text(
              "Logout",
              style: TextStyle(
                color: AppColors.black,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const Text("Profile"),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoUrl!),
            ),
            Text('Name : ${user.displayName!}'),
            Text('Email : ${user.email}'),
            Text('google_id : ${user.id}'),
            Text('photoUrl : ${user.photoUrl}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutePaths.mainRoute);
              },
              child: const Text("Go to Home Page"),
            )
          ],
        ),
      ),
    );
  }
}

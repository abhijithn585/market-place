import 'package:flutter/material.dart';

class ProfileEditingPage extends StatelessWidget {
  const ProfileEditingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: () {}, child: Text("Done")),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 200,
                  width: 170,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/profile.jpg"),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  Name",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Name",
                  hintStyle: TextStyle(
                    color: Color(0xFF996E4D),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Details",
                  hintStyle: TextStyle(
                    color: Color(0xFF996E4D),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  Email",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Color(0xFF996E4D),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "  Phone Number",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(
                    color: Color(0xFF996E4D),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

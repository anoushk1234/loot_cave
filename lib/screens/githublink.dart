import 'package:flutter/material.dart';
class GitHubLink extends StatefulWidget {
  @override
  _GitHubLinkState createState() => _GitHubLinkState();
}

class _GitHubLinkState extends State<GitHubLink> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub"),
      ),
      body: Container(
        child: Center(
          child: Card(
            child: Text("My git hub [sorry had no time for this page]:https://github.com/anoushk1234/loot_cave"),
          ),
        ),
      ),
    );
  }
}

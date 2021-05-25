import 'package:flutter/material.dart';
import 'package:mini/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('DashBoard'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.chat)),
              Tab(
                icon: Icon(Icons.ac_unit),
              ),
              Tab(
                icon: Icon(Icons.ac_unit_rounded),
              ),
              Tab(icon: Icon(Icons.chat)),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.yellowAccent),
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                child: Text('Name'),
              ),
              ListTile(
                title: Text('Log Out'),
                onTap: () async {
                  await _auth.signOut();
                },
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Text('next'), Text('jjja'), Text('jakd'),Text('lahfa')],
        ),
      ),
    );
  }
}

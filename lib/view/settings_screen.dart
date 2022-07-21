import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/Settings-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black,),
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('General'),
            ),
            ListTile(
              leading: Icon(Icons.system_update_alt),
              title: Text('Unit system'),
              subtitle: Text('Metric'),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('Interface'),
            ),
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('Theme'),
              subtitle: Text('System default'),
            ),
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('Dark theme'),
              subtitle: Text('Default'),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('API key'),
            ),
            ListTile(
              leading: Icon(Icons.keyboard),
              title: Text('API key'),
              subtitle: Text('current using default API key (not recommended)'),
            ),
            ListTile(
              leading: Icon(Icons.refresh),
              title: Text('Reset API key'),
            ),
            ListTile(
              leading: Icon(Icons.arrow_circle_up),
              title: Text('Learn more'),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.space_bar, color: Colors.white,),
              title: Text('About'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('About climate'),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}

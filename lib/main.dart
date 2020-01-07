import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Romuald Barbe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.amber, Colors.amber[200]])),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Center(
              child: Row(
                children: <Widget>[
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
//              height: 50,
                      width: 100.0,
                      child: ClipOval(
                        child: Align(
                            alignment: Alignment.topCenter,
                            widthFactor: 1,
                            heightFactor: 1,
                            child: Image.asset('assets/profil_online.jpg')),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        'Well-rounded Flutter Engineer',
                        style: TextStyle(color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              children: [
                FlatButton.icon(
                  icon: SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset('assets/mail.png')),
                  label: Text('Mail'),
                  onPressed: () async {
                    const url = 'mailto:barbe.romuald@gmail.com';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  }
                ),
                FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/github_logo.png')),
                    label: Text('Github'),
                    onPressed: () async {
                      const url = 'https://github.com/hawkbee1';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                ),
                FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/twitter.png')),
                    label: Text('Github'),
                    onPressed: () async {
                      const url = 'https://twitter.com/WhereAssistant';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                ),
                FlatButton.icon(
                    icon: SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset('assets/linkedin_logo.png')),
                    label: Text('Github'),
                    onPressed: () async {
                      const url = 'https://www.linkedin.com/in/hawkbee/?locale=en_US';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

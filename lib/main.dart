import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to adsequor.fr',
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
    const kHtml = '<H1>soidjsoidjfoidsjf</H1></H1><iframe width="280" height="163" src="https://www.youtube.com/embed/7PxCys_X4GY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><H1>va pas ?</H1>';
    bool webView = true;
    bool webViewJs = true;

    final textColor = TextStyle(color: Colors.black87);
    final textBold = TextStyle(fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.amber, Colors.amber[100]])),
        ),
        title: Text(
          widget.title,
          style: textColor,
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400),
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
                          'Flutter Engineer\n\nbarbe.romuald@gmail.com',
                          style: textColor,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  children: [
                    /*
                    mailto: is not working with web interface

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
                        }),
                     */
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
                        }),
                    FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/twitter.png')),
                        label: Text('Twitter'),
                        onPressed: () async {
                          const url = 'https://twitter.com/WhereAssistant';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                    FlatButton.icon(
                        icon: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/linkedin_logo.png')),
                        label: Text('LinkedIn'),
                        onPressed: () async {
                          const url =
                              'https://www.linkedin.com/in/hawkbee/?locale=en_US';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                      text: TextSpan(style: textColor, children: [
                    TextSpan(
                        text:
                            'I am a French freelance with a Masters Degree in Engineering (computer simulation), '),
                    TextSpan(
                        text:
                            'well-rounded experience in Information Technology and hands-on experience using '),
                    TextSpan(style: textBold, text: 'Dart'),
                    TextSpan(text: ' and '),
                    TextSpan(style: textBold, text: 'Flutter.'),
                  ])),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                            offset: new Offset(2.0, 1.0),
                            blurRadius: 2.0,
//                            spreadRadius: 40.0
                        )
                      ],
                      border: Border.all(
                        color: Colors.black87,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        gradient: LinearGradient(
                            colors: [Colors.amber, Colors.amber[100]])),
                    child: InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            'Download Resume',
                            style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                        onTap: () async {
                          const url =
                              'https://drive.google.com/file/d/1dD_mQ01qFQrOioW0xoKZlH1dzZiLPpIG/view?usp=sharing';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        }),
                  ),
                ),
              ),
              CheckboxListTile(
                value: webView,
                onChanged: (v) => setState(() => webView = v),
                title: HtmlWidget('<var>.webView</var>'),
                subtitle: const Text('Renders web view, default ❌'),
              ),
              CheckboxListTile(
                value: webViewJs,
                onChanged: (v) => setState(() {
                  if (v) webView = true;
                  webViewJs = v;
                }),
                title: HtmlWidget('<var>.webViewJs</var>'),
                subtitle: const Text('Allows JavaScript execution, default ✅'),
              ),
              HtmlWidget(
                kHtml,
                key: Key("$webView$webViewJs"),
                unsupportedWebViewWorkaroundForIssue37: true,
                webView: webView,
                webViewJs: webViewJs,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
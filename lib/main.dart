import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'inappview.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slack Profile',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Slack Profile'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String urlPath = 'https://github.com/maqamylee0';

  openGithub() async {
    print("github oooooo");

    try{
      await launchUrl(Uri.parse(urlPath));
    } catch(e) {
      throw 'Could not launch $urlPath';
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: SafeArea(

        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.8,
          child: SingleChildScrollView(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Emmilly Namuganga',
                    style: TextStyle(
                        fontSize: 30
                    ),
                  ),
                ),
                SizedBox(
                    height: 300,
                    width: 300,
                    child:

                    Image.asset('assets/emily.png')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(onPressed:(){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>InAppWebViewPage()));},
                        child: Text("Click to Open Github")
                      )),
                )

              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

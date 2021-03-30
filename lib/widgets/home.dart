import 'package:flutter/material.dart';
import '../widgets/custom_text.dart';
import './page_quizz.dart';

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
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Card(
                elevation: 10,
                child: Container(
                    height: MediaQuery.of(context).size.width * 0.8,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Image.asset(
                      'assets/cover.jpg',
                      fit: BoxFit.cover,
                    ))),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed))
                    return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                  return null; // Use the component's default.
                  },
                )),
              child: CustomText('Commencer le quizz', factor: 1.5),
              onPressed: () => {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return PageQuizz();
                }))
              },
            )
          ],
        ),
      ),
    );
  }
}

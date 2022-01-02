import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isExpanded = false;
  bool isExpanded2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
        body: Builder(builder: (context) {
          double width = MediaQuery.of(context).size.width;
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 40,
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      height: 50,
                      width: width - 24,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isExpanded = !isExpanded;
                                      if(!isExpanded2){
                                      // when decreasing
                                        Future.delayed(
                                                Duration(milliseconds: 200))
                                            .then((value) {
                                              setState(() {

                                                isExpanded2 = !isExpanded2;
                                              });
                                        });
                                      }else{
                                        //when increasing
                                        isExpanded2 = !isExpanded2;
                                      }
                                    });
                                  },
                                  icon: isExpanded
                                      ? Icon(Icons.close)
                                      : Icon(Icons.line_weight_sharp)),
                              Text("1 outlet selected"),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Builder(builder: (context) {
                      return AnimatedContainer(
                        width: width - 24,
                        height: isExpanded ? 500 : 0,
                        color: Colors.green,
                        duration: Duration(milliseconds: 200),
                        child: isExpanded2
                            ? Column(
                          children: [
                            Container(
                              color: Colors.yellow,
                              child: SizedBox(
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Container(
                              color: Colors.orange,
                              child: SizedBox(
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Container(
                              color: Colors.yellow,
                              child: SizedBox(
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ],
                        ): Container(),
                      );
                    }),
                  ],
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

double paperize = 842;
var a4 = true;
String folha_nome = 'A4';
double fator_preco = 1;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void fn_aFour() {
    // a4 = !a4;
    print(a4);

    if (a4) {
      setState(() {
        paperize = 842;
        folha_nome = 'A4';
        fator_preco = 1;
      });
      a4 = !a4;
    } else {
      setState(() {
        paperize = 842 / 2;
        folha_nome = 'A5';

        fator_preco = 0.8;
      });
      a4 = !a4;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_left,
                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
              Listener(
                onPointerDown: (event) {
                  print(event.position-event.localPosition);

                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 51,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Text(
                        'PROMOÇÃO',
                        style: TextStyle(fontSize: 20),
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_right,
                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
          Center(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: .5),
                ),
                padding: EdgeInsets.all(20 * fator_preco),
                height: paperize,
                width: 595,
                child:
                    // // Column(
                    // //   mainAxisAlignment: MainAxisAlignment.start,
                    // //   children: <Widget>[

                    Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 500,
                                  child: Text(
                                    'PURIFICADOR DE AR',
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 30 * fator_preco,
                                      fontFamily: 'Qanelas',
                                    ),
                                  )),
                            ],
                          ),
                          Center(
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10 * fator_preco),
                                    width: 553,
                                    child: Text(
                                      'Marmeladinha caseira'.toUpperCase(),
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      style: TextStyle(
                                        fontSize: 63 * fator_preco,
                                        fontFamily: 'Qanelas',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 10 * fator_preco),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Puro Malte'.toUpperCase(),
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 25 * fator_preco,
                                          ),
                                        ),
                                        Text(
                                          '12x696ml',
                                          textAlign: TextAlign.center,
                                          softWrap: true,
                                          style: TextStyle(
                                            fontSize: 25 * fator_preco,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: -35 * (1 / fator_preco),
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            Divider(
                              indent: 40,
                              endIndent: 20,
                              height: 0,
                              thickness: 2,
                              color: Colors.black,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'R\$ ',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 50 * fator_preco,
                                  ),
                                ),
                                Text(
                                  '27',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 250 * fator_preco,
                                      color: Colors.black),
                                ),
                                Text(
                                  ',45',
                                  softWrap: true,
                                  style: TextStyle(
                                    fontSize: 100 * fator_preco,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // ],
              ),
              Image(
                image: AssetImage('assets/images/Oferta-G.png'),
              )
            ],
          )),
        ],
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          fn_aFour();
        },
        tooltip: 'Increment',
        child: Text(folha_nome),
      ),
    );
  }
}

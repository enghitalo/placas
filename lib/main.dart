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

List<int> dataset = [0, 1];
List<String> family = ['', ''];
List<String> marca = ['REPOLHO ROXO', 'MARMELANDINHA CASEIRA'];
List<String> tipo = ['', ''];
List<String> unidade = ['kg', 'kg'];
List<double> price = [0, 99.99];
List<String> model = ['E', 'M'];
// var top_padding = 200 * fator_preco;
// var right_padding = 20 * fator_preco;
// var bottom_padding = 20 * fator_preco;
// var left_padding = 20 * fator_preco;
bool isBoder = true;

List<String> models_of_boards = [
  "Feirinha",
  "Regular",
  "Oferta",
  "Promoção",
  "Scanner"
];

Map map_product;
int index_models_of_boards = 0;
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

  void fn_aFour() {
    // a4 = !a4;
    print(a4);
    isBoder = !isBoder;
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
                  onPressed: () {
                    if (index_models_of_boards == 0) {
                      setState(() {
                        index_models_of_boards = models_of_boards.length - 1;
                      });
                    } else {
                      setState(() {
                        index_models_of_boards--;
                      });
                    }
                  },
                  child: Icon(
                    Icons.arrow_left,
                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
              Listener(
                onPointerDown: (event) {
                  print(event.position - event.localPosition);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 51,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Text(
                        models_of_boards[index_models_of_boards],
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
                  onPressed: () {
                    if (index_models_of_boards == models_of_boards.length - 1) {
                      setState(() {
                        index_models_of_boards = 0;
                      });
                    } else {
                      setState(() {
                        index_models_of_boards++;
                      });
                    }
                  },
                  child: Icon(
                    Icons.arrow_right,
                  ),
                ),
                margin: EdgeInsets.all(10),
              ),
            ],
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  // if (index_models_of_boards == 0) {
                  //   setState(() {
                  //     index_models_of_boards = models_of_boards.length - 1;
                  //   });
                  // } else {
                  //   setState(() {
                  //     index_models_of_boards--;
                  //   });
                  // }
                },
                child: Icon(
                  Icons.arrow_left,
                ),
              ),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1),
                    ),
                    padding: EdgeInsets.only(
                      top: 150 * fator_preco,
                      right: 20 * fator_preco,
                      bottom: 20 * fator_preco,
                      left: 20 * fator_preco,
                    ),
                    height: paperize,
                    width: 595,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          for (var index in dataset)
                            Content(
                              index: index,
                              models_of_boards:
                                  models_of_boards[index_models_of_boards],
                            )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  // if (index_models_of_boards == 0) {
                  //   setState(() {
                  //     index_models_of_boards = models_of_boards.length - 1;
                  //   });
                  // } else {
                  //   setState(() {
                  //     index_models_of_boards--;
                  //   });
                  // }
                },
                child: Icon(
                  Icons.arrow_right,
                ),
              ),
            ],
          )),
        ],
      ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(models_of_boards[index_models_of_boards]);

          fn_aFour();
        },
        tooltip: 'Increment',
        child: Text(folha_nome),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final models_of_boards;
  final index;

  const Content({Key key, this.models_of_boards, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double w = 553;
    double h = 842;

    if (models_of_boards == null) {
    } else if (models_of_boards == "Feirinha") {
      return Stack(
        children: [
          Positioned(
            left: model[index] == 'E'
                ? 25
                : model[index] == 'M'
                    ? 25
                    : 0,
            right: model[index] == 'E'
                ? (w / 2)+25
                : model[index] == 'M'
                    ? 25  
                    : 0,
            top: -12.5,        
            child: Container(
              height: h / 4,
              width: w / 2,
              child: Center(
                child: Text(marca[index],
                  style: TextStyle(fontFamily: 'Qanelas-Bold', fontSize: 50),textAlign: TextAlign.center,),
              ),
            ),
          ),
          Positioned(
            left: model[index] == 'E'
                ? w / 2
                : model[index] == 'M'
                    ? 0
                    : 0,
            right: model[index] == 'E'
                ? 10
                : model[index] == 'M'
                    ? 0
                    : 0,
            top: model[index] == 'E'
                ? 0
                : model[index] == 'M'
                    ? h / 4
                    : 0,
            bottom: 10,
            child: Container(
              height: h / 4,
              width: w / 2,
              child: Center(
                child: Text(
                  price[index].toString(),
                  style: TextStyle(fontFamily: 'Qanelas-Bold', fontSize: 100),
                ),
              ),
            ),
          ),
          Center(
            child: Image(
              image: model[index] == 'E'
                  ? AssetImage('assets/images/Espelho.png')
                  : model[index] == 'M'
                      ? AssetImage('assets/images/traco-M.png')
                      : AssetImage('assets/images/traco-M.png'),
            ),
          ),
        ],
      );
    } else if (models_of_boards == "Regular") {
      return Container(
        color: Colors.green,
        child: Text(models_of_boards),
      );
    } else if (models_of_boards == "Oferta") {
      return Container(
        color: Colors.black,
        child: Text(models_of_boards),
      );
    } else if (models_of_boards == "Promoção") {
      return Container(
        color: Colors.black,
        child: Text(models_of_boards),
      );
    } else if (models_of_boards == "Scanner") {
      return Container(
        color: Colors.black,
        child: Text(models_of_boards),
      );
    }
  }
}

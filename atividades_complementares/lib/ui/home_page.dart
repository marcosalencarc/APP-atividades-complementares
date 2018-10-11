import 'package:atividades_complementares/model/user.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:atividades_complementares/constants/curso_constants.dart' as cursoConstants;

class HomePage extends StatefulWidget {
  final User userlogado;

  @override
  _HomePageState createState() => _HomePageState();

  HomePage(this.userlogado);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromRGBO(68, 181, 215, 1.0),
      body: Column(

        children: <Widget>[
          Container(
            height: 40.0,
          ),
          Expanded(
            flex: 3,
            child:  CircularPercentIndicator(
              radius: 200.0,
              lineWidth: 18.0,
              fillColor: Color.fromRGBO(68, 181, 215, 1.0),
              animation: true,
              percent: progresso(),
              center: new Text(
                "${progresso()}%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              backgroundColor: Colors.red,
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.lightGreenAccent,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[Icon(Icons.assignment), Text("Atividades")],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  double progresso(){
    return 100.0 * widget.userlogado.horasProgresso / cursoConstants.cursoHoras[widget.userlogado.curso];
  }
}

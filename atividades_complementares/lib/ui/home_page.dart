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
          Container(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Container(
                height: 60.0,
                width: 80.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${cursoConstants.cursoHoras[widget.userlogado.curso]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),),
                      Text("Exigente", style: TextStyle(fontSize: 12.0),),
                    ],
                  )
              ),
              Spacer(),
              Container(
                height: 60.0,
                width: 80.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),color: Colors.white),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${cursoConstants.cursoHoras[widget.userlogado.curso] - widget.userlogado.horasProgresso}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),),
                      Text("Restantes"),
                    ],
                  )
              ),
              Spacer(),
              Container(
                height: 60.0,
                width: 80.0,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0),color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("${widget.userlogado.horasProgresso}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),),
                    Text("Concluidas"),
                  ],
                )
              ),
              Spacer(),
            ],
          ),

          Expanded(
            flex: 3,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  RaisedButton(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
                    onPressed: (){},
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.assignment,color: Colors.white,),
                          Text("Atividades", style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                    ),
                    color: Colors.blueAccent,
                  ),
                  Container(
                    width: 10.0,
                  ),
                  RaisedButton(
                    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0)),
                    onPressed: (){},
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.chat,color: Colors.white,),
                          Text("Fórum", style: TextStyle(color: Colors.white,),),
                        ],
                      ),
                    ),
                    color: Colors.blueAccent,
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

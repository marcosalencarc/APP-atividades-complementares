import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: CircularPercentIndicator(
            radius: 200.0,
            lineWidth: 10.0,
            percent: 0.8,
            center: new Text("${80}%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.0),),
            footer: Text("Progresso de atividades complementares"),
            backgroundColor: Colors.red,
            progressColor: Colors.green,
          ),),

          FlatButton(
              child: Row(
                children: <Widget>[
                  Icon(Icons.assignment),
                  Text("Atividades")
                ],
              ),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}

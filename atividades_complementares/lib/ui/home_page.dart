import 'package:atividades_complementares/model/user.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


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

      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(child: CircularPercentIndicator(
            radius: 200.0,
            lineWidth: 10.0,
            percent: 0.8,
            center: new Text("${widget.userlogado.horasProgresso}%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50.0),),
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

import 'package:atividades_complementares/DAO/user_dao.dart';
import 'package:atividades_complementares/model/user.dart';
import 'package:atividades_complementares/ui/groups_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:atividades_complementares/constants/curso_constants.dart' as cursoConstants;
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences prefs;
class HomePage extends StatefulWidget {
  User userlogado;

  @override
  _HomePageState createState() => _HomePageState();

  HomePage({this.userlogado});
}

class _HomePageState extends State<HomePage> {
  UserDAO userDAO = UserDAO();
  @override
  void initState() {
    _getUser();
    super.initState();
  }

  void _getUser() async {
    prefs = await SharedPreferences.getInstance();
    widget.userlogado = await userDAO.getUserLogin(prefs.getString("login"));
    print(widget.userlogado);

  }
  @override
  Widget build(BuildContext context) {
    _getUser();
    return Scaffold(
      backgroundColor:  Color.fromRGBO(196, 210, 235, 1.0),
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
              fillColor:  Color.fromRGBO(196, 210, 235, 1.0),
              animation: true,
              percent: progresso(),
              center: new Text(
                "${(progresso()*100).toStringAsFixed(2)}%",
                style:
                new TextStyle(fontWeight: FontWeight.bold, fontSize: 32.0),
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
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GroupPage()));
                    },
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
                    color: Color.fromRGBO(64, 78, 130, 1.0),
                  ),
                  Container(
                    width: 18.0,
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
                    color: Color.fromRGBO(64, 78, 130, 1.0),
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
    return (100.0 * widget.userlogado.horasProgresso / cursoConstants.cursoHoras[widget.userlogado.curso])/100;
  }
}

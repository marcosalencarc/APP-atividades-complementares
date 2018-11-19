import 'package:atividades_complementares/ui/category_page.dart';
import 'package:flutter/material.dart';
import 'package:atividades_complementares/constants/groups_constants.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {

  List<IconData> icones = [Icons.business,Icons.color_lens, Icons.map, Icons.account_balance, Icons.school, Icons.assignment_ind,Icons.extension];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Grupos de Atividades"),
        ),
        backgroundColor: Color.fromRGBO(196, 210, 235, 1.0),
        body: GridView.builder(
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: 7,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(),
                      color: Color.fromRGBO(64, 78, 130, 1.0),
                      borderRadius: BorderRadius.circular(4.0)
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(icones[index], size: 36.0, color: Colors.white,),
                          Container(height: 8.0,),
                          Text(groups[index].descricao, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),textAlign: TextAlign.center,)
                        ],
                      )
                  ),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage(groups[index])));
                },
              );
            }
        )
    );
  }
}

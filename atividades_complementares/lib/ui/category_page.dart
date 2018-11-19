import 'package:atividades_complementares/model/grupo.dart';
import 'package:atividades_complementares/ui/activities_pages.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  Grupo group;
  @override
  _CategoryPageState createState() => _CategoryPageState();
  CategoryPage(this.group);


}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categorias"),
        ),
        backgroundColor: Color.fromRGBO(196, 210, 235, 1.0),
        body: GridView.builder(
            padding: EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: widget.group.categorias.length,
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
                          Container(height: 8.0,),
                          Text(widget.group.categorias[index].nome, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),textAlign: TextAlign.center,)
                        ],
                      )
                  ),
                onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ActivitiesPage(categoria:widget.group.categorias[index])));
                },

              );
            }
        )
    );
  }
}

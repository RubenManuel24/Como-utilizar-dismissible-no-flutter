import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

  List lista = ["Maria",
                "Pedro",
                "Carlos",
                "João",
                "Lucas",
                "Ana"];

    return Scaffold(
      appBar: AppBar(
        title:Text("Dismissible"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child:  ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index){
            return Dismissible(
              key: Key(index.toString()), 
              child: ListTile(
               title: Text(lista[index]),
              ),
              background: Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.edit)
                  ]),
              ),
              secondaryBackground: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete)
                  ],)
              ),
              direction: DismissDirection.horizontal,
              onDismissed: (descricaoDadirecao){
                //print("Direção: "+descricaoDadirecao.toString());

                if(descricaoDadirecao == DismissDirection.endToStart){
                  print("EndToStart");
                  lista.removeAt(index);
                }
                else{
                  print("StartToEnd");
                }
              },
              );
          }
           ),
          )
          ],)
      ),
    );
  }
}
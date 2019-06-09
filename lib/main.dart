import 'package:flutter/material.dart';

void main(){
  
  runApp(MaterialApp(
      title: "Contador de Passoas",
      home: Home()           
    ));
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var counter = 0;
  var statusPessoa = "Vazio!";
  void chandeValue(int value){
    setState(() {
      counter = counter + value;
      if (counter == 0) {
        statusPessoa = "Vazio!";
      }else{
        if((counter > 0) && (counter <= 10)){
          statusPessoa = "Estamos Funcionando!";
        }else if(counter < 0){
          statusPessoa = "Houston we have a problem!";          
        }else{
          statusPessoa = "Estamos Lotados!";
          counter = 10;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    

    return Stack(
        children: <Widget>[
          Image.asset(
            "images/background.jpg",
            fit: BoxFit.cover,
            height: 1000.00,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[          
              Text(
                "Pessoas: $counter",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                                child: Text("+1", style: TextStyle(fontSize: 40.0,color: Colors.white)),
                                onPressed: (){
                                  chandeValue(1);
                                },
                              ), 
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                                child: Text("-1", style: TextStyle(fontSize: 40.0,color: Colors.white)),
                                onPressed: (){
                                  chandeValue(-1);
                                },
                              ), 
                    ),                 
                  ],
                ),            
                Text(                                    
                  '$statusPessoa',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, 
                                fontStyle: FontStyle.italic,
                                fontSize: 30.0
                                )
                )
            ],
          )
        ],
      );
  }
}
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:stat_aprianto/cubit/counter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: new Drawer(),
      appBar: AppBar(
        title: Text("State Management BLoC"),
        backgroundColor: Colors.blue[200],
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: new Icon(Icons.house_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),  
      ),

      body: Center(
        child: Card(
          elevation: 50,
          shadowColor: Colors.black,
          color: Colors.blue[200],
          child: SizedBox(
            width: 500,
            height: 450,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 108,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://i.ibb.co/pW0QxpL/alexandra-daddario-2880x1800-xtrafondos-com.jpg"), //NetworkImage
                      radius: 100,
                    ), //CircleAvatar
                  ), //CirclAvatar
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    'StatementManagementBLoC',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ), //Textstyle
                  ), //Text
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  Text(
                    "Pertemuan 9",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ), //Textstyle
                  ), //Text
                  SizedBox(
                    height: 10,
                  ), //SizedBox
                  SizedBox(
                    width: 80,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.pushNamed(context, '/catalog')
                      },
                      color: Colors.blue[700],
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          children: [
                            Icon(Icons.people_alt_outlined),
                            Text('Visit', style: TextStyle(
                              color: Colors.white,
                            ),),
                          ],
                        ), //Row
                      ), //Padding
                    ), //RaisedButton
                  ) //SizedBox
                ],
              ), //Column
            ), //Padding
          ), //SizedBox
        ), //Card
      ),
      
    );
  }
}

import 'package:flutter/material.dart';
import 'style.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'First Flutter App',
      theme : ThemeData(
        primaryColor: Colors.blue,
        //primarySwatch: Colors.orange, - 색 변환
        fontFamily: 'Pretendard',
      ),
      home : MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final items = List.generate(100, (index) => index).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        backgroundColor: AppColor.Molachite,
        title: const Text('Assignment2'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person))

        ],

      ),
      body:
          Center(
            child: Column(
              children: [
                    const Stack(
                      alignment: Alignment.center,
                      children: [
                        Opacity(opacity: 0.2,
                          child:
                              Padding(
                                  padding: EdgeInsets.all(40.0),
                                child:
                                Image(
                                    image: AssetImage(
                                        'assets/warning.jpeg'
                                    ),
                                    width : 200.0),

                              ),

                            ),
                            Text('This page does not include contents'),
                      ],
                    ),
                Expanded(
                  child: ListView(
                  scrollDirection: Axis.vertical,
                    children: [
                    ListTile(
                    leading: const Icon(Icons.home),
                    title: Text('Home'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){},
                    ),
                    ListTile(
                    leading: const Icon(Icons.search),
                    title: Text('Error Search'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){},
                    ),
                    ListTile(
                    leading: const Icon(Icons.refresh),
                    title: Text('Refresh'),
                    trailing: Icon(Icons.navigate_next),
                    onTap: (){},
                    ),
                    ]),
                ),


                    ],
                  ),
          ),


      drawer: Drawer(),
    );
  }
}

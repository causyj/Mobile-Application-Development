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
        primarySwatch: Colors.purple,
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
    return DefaultTabController(
      length : 3,
      child: Scaffold(
        appBar : AppBar(
          backgroundColor: AppColor.Molachite,
          title: const Text('Flutter Demo'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.tag_faces)),
              Tab(text: 'Menu'),
              Tab(icon: Icon(Icons.info), text: 'Info'),
            ],
          ),

        ),
        body : TabBarView(
            children: [
             Tab(
               child:LinearProgressIndicator(

               ),
             ),


        //  카드 예제
        //  child : Card(
              //    shape: RoundedRectangleBorder(
              //      borderRadius: BorderRadius.circular(10.0),
              //    ),
              //    elevation: 4.0,
              //    child: Container(
              //      width:100,
              //      height:100,
              //      child: Center(child: Text('text')),
              //    ),
              //  ),
              // ),


                 //상자 예제
              // child: Row(
                 //   children: [
                 //     Expanded(
                 //       flex:3,
                 //       child: Container(
                 //         color : Colors.red,
                 //         width : 100,
                 //         height : 100,
                 //       ),
                 //     ),
                 //     Expanded(
                 //       flex:1,
                 //       child:Container(
                 //
                 //           color : Colors.green,
                 //           width : 100,
                 //           height : 100,
                 //         ),
                 //     ),
                 //     Expanded(
                 //       flex:2,
                 //       child: Container(
                 //         color : Colors.blue,
                 //         width : 100,
                 //         height : 100,
                 //       ),
                 //     ),
                 //   ],
                 // ),
              Container(
                color : Colors.green,
              ),
              Container(
                color : Colors.blue,
              ),

            ],
          ),

        //1. 옆으로 넘기면
        // PageView(
        //   children: [
        //    Container(
        //      color : Colors.red,
        //    ),
        //     Container(
        //       color : Colors.green,
        //     ),
        //     Container(
        //       color : Colors.blue,
        //     ),
        //
        //   ],
        // ),


        //0. Grid 예제
        // GridView.count(
        //     crossAxisCount: 3,
        //     children: [
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //       Container(
        //         color : Colors.red,
        //         width : 100,
        //         height: 100,
        //         padding: EdgeInsets.all(8.0),
        //         margin: EdgeInsets.all(8.0),
        //       ),
        //
        //     ],
        // ),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Notiication"),


          ],
        ),
      ),
    );
  }
}

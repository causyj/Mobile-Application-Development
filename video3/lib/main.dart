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
        title: const Text('Flutter Demo'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],

      ),
      body: ListView(
        scrollDirection: Axis.vertical,
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('Home'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: Text('Calendar'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ), ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ), ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),ListTile(
              leading: const Icon(Icons.camera),
              title: Text('Camera'),
              trailing: Icon(Icons.navigate_next),
              onTap: (){},
            ),






          ],
      ),
      // Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Container(
      //       color : Colors.red,
      //       width: 100.0,
      //       height: 100.0,
      //       padding: EdgeInsets.all(8.0),
      //       margin: EdgeInsets.all(10.0),
      //     ),
      //     Container(
      //       color : Colors.blue,
      //       width: 80.0,
      //       height: 80.0,
      //       padding: EdgeInsets.all(8.0),
      //       margin: EdgeInsets.all(10.0),
      //     ),
      //     Container(
      //       color : Colors.green,
      //       width: 60.0,
      //       height: 60.0,
      //       padding: EdgeInsets.all(8.0),
      //       margin: EdgeInsets.all(10.0),
      //     ),
      //   ],
      // ),
      drawer: Drawer(),
    );
  }
}

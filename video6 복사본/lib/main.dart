import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Home Page",
      theme: ThemeData(

      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
 final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = List.generate(20, (i) => i);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
        ],
      ),
      body: ReorderableListView.builder(
          itemCount: items.length,
          itemBuilder: (c,i){
            return Dismissible( // 옆으로 삭제 가능
              background: Container(color: Colors.green),
              key: ValueKey(items[i]),
              child: ListTile(
                key: ValueKey(items[i]),
                title: Text('Student ${items[i]}'),
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.navigate_next),
              ),
              onDismissed: (direction){
                setState(() {
                  items.removeAt(i);
                });
              },
            );
          },
        onReorder: (int oldIndex, int newIndex){
            setState(() {
              if(oldIndex < newIndex){
                newIndex -= 1;
              }
              items.insert(newIndex, items.removeAt(oldIndex));
            });
        },
      )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class UniqueColorGenerator{
  static Random random = Random();
  static Color getColor() {
    return Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}


class MyTile extends StatefulWidget {
  MyTile({Key? key}) : super(key:key);

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  final Color myColor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      width:100,
      height:100,
      color: myColor,
    );
  }
}
//3.list 좌르륵 - 자리 이동 가능
// body: ReorderableListView.builder(
//           itemCount: items.length,
//           itemBuilder: (c,i){
//             return ListTile(
//               key: ValueKey(items[i]),
//               title: Text('Student ${items[i]}'),
//               leading: const Icon(Icons.home),
//               trailing: const Icon(Icons.navigate_next),
//             );
//           },
//         onReorder: (int oldIndex, int newIndex){
//             setState(() {
//               if(oldIndex < newIndex){
//                 newIndex -= 1;
//               }
//               items.insert(newIndex, items.removeAt(oldIndex));
//             });
//         },
//       )

//2. list 좌르륵 - 근데 자리 못 옮김
// List items = List.generate(20, (i) => i);
// body: ListView.builder(
//   itemCount: items.length,
//   itemBuilder: (c,i){
//   return ListTile(
//   title: Text('Student ${items[i]}'),
//   leading: const Icon(Icons.home),
//   trailing: const Icon(Icons.navigate_next),
// );

//1. statefulwidget
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "My Home Page",
//       theme: ThemeData(
//
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Widget> myTiles = [Padding(
//     key:UniqueKey(),
//     padding: const EdgeInsets.all(8.0),
//     child: MyTile(key:UniqueKey()),
//   ), Padding(
//     key:UniqueKey(),
//     padding: const EdgeInsets.all(8.0),
//     child: MyTile(key: UniqueKey()),
//   ),];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Home Page'),
//         actions: [
//           IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
//         ],
//       ),
//       body: Row(
//         children: myTiles,
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.swap_calls),
//         onPressed: (){
//           setState(() {
//             myTiles.insert(1, myTiles.removeAt(0));
//           });
//         },
//
//       ),// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// class UniqueColorGenerator{
//   static Random random = Random();
//   static Color getColor() {
//     return Color.fromARGB(
//         255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
//   }
// }
//
//
// class MyTile extends StatefulWidget {
//   MyTile({Key? key}) : super(key:key);
//
//   @override
//   State<MyTile> createState() => _MyTileState();
// }
//
// class _MyTileState extends State<MyTile> {
//   final Color myColor = UniqueColorGenerator.getColor();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width:100,
//       height:100,
//       color: myColor,
//     );
//   }
// }
// */


//0.Stateless
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "My Home Page",
//       theme: ThemeData(
//
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<Widget> myTiles = [MyTile(), MyTile(),];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Home Page'),
//         actions: [
//           IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
//         ],
//       ),
//       body: Row(
//           children: myTiles,
//   ),
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.swap_calls),
//           onPressed: (){
//             setState(() {
//               myTiles.insert(1, myTiles.removeAt(0));
//             });
//   },
//
//           ),// This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// class UniqueColorGenerator{
//   static Random random = Random();
//   static Color getColor() {
//     return Color.fromARGB(
//         255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
//   }
//   }
//
//
// class MyTile extends StatelessWidget {
//   MyTile({Key? key}) : super(key:key);
//   final Color myColor = UniqueColorGenerator.getColor();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width:100,
//       height:100,
//       color: myColor,
//     );
//   }
// }
//

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  String text='';
  double squareside = 100;
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              child: AnimatedContainer(
                width: squareside,
                height:squareside,
                color: Colors.orange,
                duration: const Duration(seconds:1), // animation
              ),
              onLongPress: (){
                setState(() {
                  if(squareside > 75){
                    squareside = 50;
                  }else{
                    squareside = 100;
                    text = 'This is normal orange square';
                  }
                });
              },

            ),
            SizedBox(
              height:20,
            ),
            Text(text,style: TextStyle(
              fontSize: 20,
            ),)
          ],
        ),
      )
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class MyForm extends StatefulWidget {

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  }


// GestureDetector(
// child: Container(
// width: 100,
// height:100,
// color: Colors.orange,
// duration: const Duration(seconds:1), // animation
// ),
// onTap: (){
// setState(() {
// if(text == ''){
// text = 'This is an orange square.';
// }else{
// text = '';
// }
// });
// },
// onLongPress: (){
//   setState(() {
//     if(text == ''){
//       text = 'This is an orange square.';
//     }else{
//       text = '';
//     }
//   });
// },



//저번 과제 with key
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
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
// final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: MyForm(),
//        // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// class MyForm extends StatefulWidget {
//   MyForm({Key? key}) : super(key: key);
//
//   @override
//   State<MyForm> createState() => _MyFormState();
// }
//
// class _MyFormState extends State<MyForm> {
//   StudentResult studentResult = StudentResult(0,0,0,0,true);
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: ListView(
//           children: [
//             TextFormField(
//               decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Mid-term exam',
//               ),
//               validator: (value){
//                 if(value == null || value.isEmpty){
//                   return 'Insert some texts';
//                 }else if(int.tryParse(value) == null){
//                   return 'Insert some integer';
//                 }
//                 return null;
//               },
//               onSaved: (value){
//                 studentResult.midTermExam = int.parse(value!);
//     }
//             ),
//             const SizedBox(
//               height:20,
//             ),
//             TextFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Final exam',
//                 ),
//                 validator: (value){
//                   if(value == null || value.isEmpty){
//                     return 'Insert some texts';
//                   }else if(int.tryParse(value) == null){
//                     return 'Insert some integer';
//                   }
//                   return null;
//                 },
//                 onSaved: (value){
//                   studentResult.finalTermExam = int.parse(value!);
//                 }
//             ),
//             const SizedBox(
//               height:20,
//             ),
//             DropdownButtonFormField(
//                 decoration: const InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Additional Point',
//                 ),
//                 value: studentResult.additionalPoint,
//                 items: List.generate(11,(i){
//                   if(i==0){
//                     return DropdownMenuItem(
//                       value:i,
//                       child: const Text('Choose the additional point')
//                     );
//                   }
//                   return DropdownMenuItem(
//                       value: i,
//                       child: Text('${i-1} point'));
//                 }),
//                 onChanged: (value){
//                   setState(() {
//                     studentResult.additionalPoint = value!;
//                   });
//                 },
//               validator: (value){
//                   if(value ==0){
//                     return 'Please select the point';
//                   }
//                   return null;
//               },
//             ),
//             const SizedBox(
//               height:20,
//             ),
//             Column(
//               children: [
//                 RadioListTile(
//                     title: const Text('Team leader (+10)') ,
//                     value: 10,
//                     groupValue: studentResult.teamLeaderPoint,
//                     onChanged: (value){
//                       setState(() {
//                         studentResult.teamLeaderPoint = value!;
//                       });
//     }
//                 ),
//                 RadioListTile(
//                     title: const Text('Team member') ,
//                     value: 10,
//                     groupValue: studentResult.teamLeaderPoint,
//                     onChanged: (value){
//                       setState(() {
//                         studentResult.teamLeaderPoint = value!;
//                       });
//                     }
//                 )],
//
//             ),
//             const SizedBox(
//               height:20,
//             ),
//             CheckboxListTile(
//                 title: const Text('Absence less than 4'),
//                 value: studentResult.attendance,
//                 onChanged: (value){
//                   setState(() {
//                     studentResult.attendance = value!;
//                   });
//                 }),
//             const SizedBox(
//               height:20,
//             ),
//             ElevatedButton(
//               child: const Text('Enter'),
//               onPressed: (){
//                 setState(() {
//                   if(_formKey.currentState!.validate()){
//                     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                       content: Text("Processing data"),
//     ));
//                   _formKey.currentState!.save();
//
//
//     }
//                 });
//     }),
//           ],
//         )
//       ),
//     );
//   }
// }
//
// class StudentResult{
//   int midTermExam;
//   int finalTermExam;
//   int teamLeaderPoint;
//   int additionalPoint;
//   bool attendance;
//
//   StudentResult(
//     this.midTermExam,
//     this.finalTermExam,
//     this.teamLeaderPoint,
//     this.additionalPoint,
//     this.attendance,
//       );
//   @override
//   String toString(){
//     return '('
//         '$midTermExam, '
//         '$finalTermExam,'
//         '$teamLeaderPoint,'
//         '$additionalPoint,'
//         '$attendance,';
//   }
// }
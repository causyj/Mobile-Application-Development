
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum Language {cpp, python, dart}
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Assignment4',
      theme : ThemeData(
        primarySwatch: Colors.orange,
        // fontFamily: 'Pretendard',
      ),
      home : const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() =>  _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage>{

  bool _isChecked = false;
  bool _isLeader = false;

  final _midtermController = TextEditingController();
  final _finalController = TextEditingController();
  String grade = ' ';
  void dispose(){
    _midtermController.dispose();
    _finalController.dispose();
    super.dispose();
  }
  final _valueList = List.generate(10, (i) => i);
  var _selectedValue = 0;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Calculator'),

      ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Center(
           child: ListView(
             children: [
               TextField(
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Mid-term exam',
                 ),
                 controller: _midtermController,
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
               ),
               Container(
                 height : 20,
               ),
               TextField(
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Final exam',
                 ),
                 controller: _finalController,
                 keyboardType: TextInputType.number,
                 inputFormatters: <TextInputFormatter>[
                   FilteringTextInputFormatter.digitsOnly
                 ],
               ),
               Container(
                 height : 20,
               ),
               //1
               RadioListTile(
                 title: Text('Project Term Leader(+10)'),
                 value: true,
                 groupValue: _isLeader,
                 onChanged: (value){
                   setState(() {
                     _isLeader = value!;
                   });
                 },),
               RadioListTile(
                 title: Text('Project Term Memeber'),
                 value: false,
                 groupValue: _isLeader,
                 onChanged: (value){
                   setState(() {
                     _isLeader = value!;
                   });
                 },),
               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: Column(
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Additional Point',style: TextStyle(fontSize:18),),
                         DropdownButton(
                           value: _selectedValue,
                           items: _valueList.map(
                                   (point) => DropdownMenuItem(
                                   value: point,
                                   child: Text('$point point'))).toList(),
                           onChanged: (value){
                             setState(() {
                               _selectedValue = value!;
                             });
                           },
                         ),
                       ],
               ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Absence less than 4',style: TextStyle(fontSize:18),),
                         Checkbox(
                             value: _isChecked,
                             onChanged: (bool? value){
                               setState(() {
                                 _isChecked = value!;
                               });

                             }
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
               Text(grade, style: TextStyle(fontSize:50, color: Colors.red ),textAlign: TextAlign.center,),
               Container(
                 height : 20,
               ),
               ElevatedButton(onPressed: (){
                 setState(() {
                   var midtermvalue = double.parse(_midtermController.text);
                   var finalvalue = double.parse(_finalController.text);
                   var score = midtermvalue + finalvalue;
                   if(_isChecked) {
                     grade = 'F';
                   }else{
                     score +=  _selectedValue;
                     if(_isLeader == true){
                       score += 10;
                     }
                     if(score >=170){
                       grade='A';
                     }else if(score >=150){
                       grade='B';}
                     else if(score >=130){
                       grade='C';}
                     else if(score >=110){
                       grade='D';}
                     else{
                       grade='F';
                     }
                   }
                 });

               },
                   child: Text('Enter')),
             ],
           ),
         ),
       ),
    );
  }
}

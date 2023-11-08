
import 'package:flutter/material.dart';

enum Language {cpp, python, dart}
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'Receive User Information',
      theme : ThemeData(
        primarySwatch: Colors.deepPurple,
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
  //1
  // bool _isChecked = false;
  // bool _isChecked2 = false;
  // bool _isChecked3 = false;
  //2
  // Language _language = Language.cpp;
  //3
  //final _valueList = List.generate(10, (i) => 'Student $i');
  //4
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  String _obesity = 'Normal';
  void dispose(){
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }
  //3
  // var _selectedValue = 'Student 0';
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive User Information'),

      ),
       body: Padding(
         padding: const EdgeInsets.all(16.0),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextField(
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Height',
                 ),
                 controller: _heightController,
                 keyboardType: TextInputType.number,
               ),
               Container(
                 height : 20,
               ),
               TextField(
                 decoration: const InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Weight',
                 ),
                 controller: _weightController,
                 keyboardType: TextInputType.number,
               ),
               Container(
                 height : 20,
               ),
               Text(_obesity, style: TextStyle(fontSize:20),),
               Container(
                 height : 20,
               ),
               ElevatedButton(onPressed: (){
                 setState(() {
                   var heightvalue = double.parse(_heightController.text.trim());
                   var weightvalue = double.parse(_weightController.text.trim());
                   if(weightvalue / (heightvalue * heightvalue) > 25){
                     _obesity = 'Obesity';
                   }else{
                     _obesity = "Normal";
                   }
                 });
               },
                   child: Text('Enter')),
             ],
           ),
         ),
       ),
      // 3
      // Center(
      //   child: DropdownButton(
      //     value: _selectedValue,
      //     items: _valueList.map(
      //         (student) => DropdownMenuItem(
      //             value: student,
      //             child: Text(student))).toList(),
      //     onChanged: (value){
      //         setState(() {
      //           _selectedValue = value!;
      //         });
      //     },
      //   ),
      // ),

      // 2. ListView(
      //   children: [
      //     RadioListTile(
      //         title: Text('C++'),
      //         value: Language.cpp,
      //         groupValue: _language,
      //         onChanged: (value){
      //           setState(() {
      //             _language = value!;
      //           });
      //         },),
      //     RadioListTile(
      //       title: Text('python'),
      //       value: Language.python,
      //       groupValue: _language,
       //       onChanged: (value){
      //         setState(() {
      //           _language = value!;
      //         });
      //       },),
      //     RadioListTile(
      //       title: Text('Dart'),
      //       value: Language.dart,
      //       groupValue: _language,
      //       onChanged: (value){
      //         setState(() {
      //           _language = value!;
      //         });
      //       },),
      //   ],
      // ),

      //1. Listview-SwitchListTile/CheckboxListTile example
      // body: ListView(
      //   children: [
      //     SwitchListTile(
      //       title: Text("Test"),
      //       value: _isChecked,
      //       onChanged: (bool? value){
      //         setState(() {
      //           _isChecked = value!;
      //         });
      //
      //       }
      //     ),
      //     CheckboxListTile(
      //         title: Text("Test2"),
      //         value: _isChecked2,
      //         onChanged: (bool? value){
      //           setState(() {
      //             _isChecked2 = value!;
      //           });
      //
      //         }
      //     ),
      //     CheckboxListTile(
      //         title: Text("Test3"),
      //         value: _isChecked3,
      //         onChanged: (bool? value){
      //           setState(() {
      //             _isChecked3 = value!;
      //           });
      //
      //         }
      //     ),
      //   ],
      // ),
    );
  }
}

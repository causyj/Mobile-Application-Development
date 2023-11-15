import 'package:flutter/material.dart';
import 'package:video7/editpage.dart';
import 'package:provider/provider.dart';
import 'scores.dart';

class ScorePage extends StatelessWidget {
  const ScorePage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scores'),
      ),
      body : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScorePanel(),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditPage()));
          }, child: Text('Edit'))
        ],
      ),
    );
  }
}
class ScorePanel extends StatelessWidget {
  const ScorePanel ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mid-Terms', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Text(context.watch<Scores>().midTermExam.toString(), style: TextStyle(fontSize: 20),),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Final', style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            Text(context.watch<Scores>().finalExam.toString() , style: TextStyle(fontSize: 20),),
          ],
        ),

      ],
    );
  }
}
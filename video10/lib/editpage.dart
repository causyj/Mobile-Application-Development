import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'scores.dart';
class EditPage extends StatelessWidget {
  const EditPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => DetailedScores(),
      builder: (context,child) => Scaffold(
        appBar: AppBar(
          title: Text('Edit Scores'),
        ),
        body : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EditPanel(),
            Text('Additional Midterm',style: TextStyle(fontSize: 16),),
            Text(context.watch<DetailedScores>().additionalMidterm.toString()),
            Text('Additional Midterm',style: TextStyle(fontSize: 16),),
            Text(context.watch<DetailedScores>().additionalFinal.toString()),
          ],
        ),
      ),
    );
  }
}
class EditPanel extends StatelessWidget {
  const EditPanel({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text('Mid-Term', style: TextStyle(fontSize: 16),), width: 100,),
            TextButton(onPressed: (){
              context.read<Scores>().decreseMidTerm();
            }, child: Text('-', style: TextStyle(fontSize: 16),), ),
            Text(context.select((Scores s) => s.midTermExam).toString(), style: TextStyle(fontSize: 16),),//얘만 바꾸고 싶을때
            TextButton(onPressed: (){
              context.read<Scores>().increseMidTerm(); //값이 업데이트 됐는지 확인 필요없을때, 필요하면 Watch
            }, child: Text('+', style: TextStyle(fontSize: 16),), ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(child: Text('Final-Term', style: TextStyle(fontSize: 16),), width: 100,),
            TextButton(onPressed: (){
              context.read<Scores>().decreseFinal();
            }, child: Text('-', style: TextStyle(fontSize: 16),), ),
            Text(context.select((Scores s) => s.finalExam).toString(), style: TextStyle(fontSize: 16),),
            TextButton(onPressed: (){
              context.read<Scores>().increseFinal();
            }, child: Text('+', style: TextStyle(fontSize: 16),), ),
          ],
        ),
      ],
    );
  }
}

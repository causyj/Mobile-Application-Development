import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'members.dart';

class TeamMemberListPage extends StatelessWidget {
  const TeamMemberListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Team Member List"),
      ),
      body: const TeamMemberListPanel(),
    );
  }
}

class TeamMemberListPanel extends StatelessWidget {
  const TeamMemberListPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MemberDetail> items = context.read<Members>().arr;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String temp = '';
          temp = temp + items[index].name;
          temp = "$temp (${items[index].number})";
          return Dismissible(
            key: ValueKey(items[index]),
            child: ListTile(
              title: Text(temp),
            ),
            onDismissed: (direction) {
              context.read<Members>().delMember(index);
            },
          );
        }
    );
  }
}
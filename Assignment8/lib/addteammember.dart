import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video7/teammemberlist.dart';
import 'members.dart';


class AddTeamMemberPage extends StatelessWidget {
  const AddTeamMemberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Team Member'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TeamMemberListPage()));
              }, icon: const Icon(Icons.list)),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TeamMemberPanel(),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      String name = '';
                      String number = '';
                      return SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            height: 200,
                            color: Colors.white,
                            child: Center(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const Text("Student No.: "),
                                        Expanded(
                                          child: TextField(
                                            onChanged: (value) {
                                              number = value;
                                            },
                                          ),
                                        ),
                                        const Text("Name: "),
                                        Expanded(
                                          child: TextField(
                                            onChanged: (value) {
                                              name = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        if (context.read<Members>().arr.length >= 3) {
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                height: 150,
                                                color: Colors.white,
                                                child: Center(
                                                  child: Text(
                                                    "The team is already full",
                                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } else {
                                          context.read<Members>().addMember(name, number);
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: const Text("Enter")),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
              },
              child: const Text('Add')),
        ],
      ),
    );
  }
}

class TeamMemberPanel extends StatelessWidget {
  const TeamMemberPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'The number of our team members is:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            context.watch<Members>().arr.length.toString(),
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
  }
}
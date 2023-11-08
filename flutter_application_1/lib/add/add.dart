import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class addpage extends StatefulWidget {
  const addpage({super.key});

  @override
  State<addpage> createState() => _addpageState();
}

class _addpageState extends State<addpage> {
  final bloodGroups = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"];
  String? selectedGroup;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');
  TextEditingController donorname = TextEditingController();
  TextEditingController donorphone = TextEditingController();

  void addDonor() {
    final data = {
      'name': 'donorname.text',
      'phone': donorphone.text,
      'group': selectedGroup
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Donnors"),
        backgroundColor: Color.fromARGB(255, 199, 8, 8),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: donorname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Donor Name")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: donorphone,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("Phone Number")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DropdownButtonFormField(
                decoration: InputDecoration(label: Text("Select Blood Group")),
                items: bloodGroups
                    .map((e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ))
                    .toList(),
                onChanged: (val) {
                  selectedGroup = val as String?;
                }),
          ),
          ElevatedButton(
              onPressed: () {
                addDonor();
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(255, 236, 16, 16),
                  ),
                  minimumSize:
                      MaterialStatePropertyAll(Size(double.infinity, 50))),
              child: Text(
                "submit",
                style: TextStyle(fontSize: 20),
              ))
        ],
      ),
    );
  }
}

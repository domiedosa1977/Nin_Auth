import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../read data/get_user_name.dart';

class DataScreenPage extends StatefulWidget {
  const DataScreenPage({super.key});

  @override
  State<DataScreenPage> createState() => _DataScreenPageState();
}

class _DataScreenPageState extends State<DataScreenPage> {
  final user = FirebaseAuth.instance.currentUser;

  // document IDs
  List<String> docIDs = [];

  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection("users").get().then(
          (snapshot) => snapshot.docs.forEach(
            (document) {
          print(document.reference);
          docIDs.add(document.reference.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(  // Use a Column as the direct child of Scaffold's body
        children: [
          Expanded(  // Place Expanded inside the Column
            child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                print(docIDs);
                return ListView.builder(
                  itemCount: docIDs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        title: GetUserName(documentId: docIDs[index]),
                        tileColor: Colors.lightGreen,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
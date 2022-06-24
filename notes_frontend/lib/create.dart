// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'main.dart';

class CreatePage extends StatefulWidget {
  final Client client;

  const CreatePage({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create"),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.client.post(
                      Uri.parse('http://127.0.0.1:8000/notes/create/'),
                      body: {'body': controller.text});
                  Navigator.pop(context);
                  
                },
                child: Text("Create Note"))
          ],
        ));
  }
}

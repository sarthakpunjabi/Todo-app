// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

class UpdatePage extends StatefulWidget {
  final Client client;
  final int id;
  final String note;

  const UpdatePage({
    Key? key,
    required this.client,
    required this.id,
    required this.note,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    controller.text = widget.note;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Update"),
        ),
        body: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.client.put(
                      Uri.parse(
                          'http://127.0.0.1:8000/notes/${widget.id}/update/'),
                      body: {'body': controller.text});
                  Navigator.pop(context);
                },
                child: Text("Update Note"))
          ],
        ));
  }
}

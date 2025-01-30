import 'package:flutter/material.dart';

class AddEditScreen extends StatefulWidget {
  const AddEditScreen({Key? key}) : super(key: key);

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add/Edit Note")),
      body: const Center(child: Text("Add/Edit Note UI here")),
    );
  }
}

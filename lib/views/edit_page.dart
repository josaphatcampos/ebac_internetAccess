import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = ModalRoute.of(context)!.settings.arguments as String;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, nameController.text);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Editar",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(label: Text("Nome")),
                  ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Hero(
                tag: 'edtBtn',
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context, nameController.text);
                            },
                            child: const Text("Salvar")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

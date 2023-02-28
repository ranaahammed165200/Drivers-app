import 'package:flutter/material.dart';

import '../mainScreen/main_screen.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  TextEditingController formController = TextEditingController();
  TextEditingController toController = TextEditingController();
  final customKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: customKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: 150,
              ),
              const Text("Form"),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Form Requird";
                  },
                  controller: formController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: "Choose Start location",
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text("To"),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return "Form Requird";
                  },
                  controller: toController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.location_pin),
                      hintText: "Choose Destination",
                      border: InputBorder.none,
                      fillColor: Colors.white),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (customKey.currentState!.validate()) {
                      await showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Succesfull"),
                          content: const Text("Your Data has Submited"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  formController.clear();
                                  toController.clear();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MainScreen(),
                                      ),
                                      (route) => false);
                                },
                                child: const Text("ok"))
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 30),
                      )))
            ]),
          ),
        ),
      ),
    );
  }
}

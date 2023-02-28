import 'package:flutter/material.dart';

class SelectItemPage extends StatefulWidget {
  const SelectItemPage({Key? key}) : super(key: key);

  @override
  State<SelectItemPage> createState() => _SelectItemPageState();
}

class _SelectItemPageState extends State<SelectItemPage> {
  String technology = '';
  String semester = "";
  String Shift = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade400,
        title: const Text("Select"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          DropdownButtonFormField(
            decoration: InputDecoration(
              hintText: "Select Distict",
              enabledBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                //<-- SEE HERE
                borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            dropdownColor: Colors.white,
            // value: dropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                technology = newValue!;
              });
            },
            items: <String>[
              'Distict 1',
              'Distict 2',
              'Distict 3',
              'Distict 4',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14, overflow: TextOverflow.ellipsis),
                ),
              );
            }).toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: (technology == "") ? false : true,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: "Select Sub Distict",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              onChanged: (String? newValue) {
                setState(() {
                  semester = newValue!;
                });
              },
              items: <String>[
                'Sub Distict 1',
                'Sub Distict 2',
                'Sub Distict 3',
                'Sub Distict 4',
                'Sub Distict 5',
                'Sub Distict 6',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  onTap: () {},
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 14, overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: (semester == "") ? false : true,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                hintText: "Select Village",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade600, width: 2),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              dropdownColor: Colors.white,
              onChanged: (String? newValue) {
                setState(() {
                  Shift = newValue!;
                });
              },
              items: <String>[
                'Village 1',
                'Village 2',
                'Village 3',
                'Village 4',
                'Village 5',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(
                        fontSize: 14, overflow: TextOverflow.ellipsis),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Visibility(
              visible: (Shift == "") ? false : true,
              child: Container(
                  width: double.infinity,
                  height: 100,
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: Text("Form"),
                              content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Text("Your Data Is Recived")]),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("ok"))
                              ]),
                        );
                      },
                      child: const Text("Submit"))))
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller =
      TextEditingController();

  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem = "e1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 5),
                      content: Text("Snackbar"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text("Open Snackbar"),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.0,
                endIndent: 200.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert Title"),
                        content: Text("Alert Content"),
                        actions: [
                          FilledButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text("Close"))
                        ],
                      );
                    },
                  );
                },
                child: Text("Open Dialog"),
              ),
              DropdownButton(
                value: menuItem,
                items: [
                  DropdownMenuItem(
                    value: "e1",
                    child: Text("Element 1"),
                  ),
                  DropdownMenuItem(
                    value: "e2",
                    child: Text("Element 2"),
                  ),
                  DropdownMenuItem(
                    value: "e3",
                    child: Text("Element 3"),
                  ),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              Text(controller.text),
              Checkbox.adaptive(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              CheckboxListTile.adaptive(
                tristate: true,
                title: Text("Cklick me"),
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              ),
              Switch.adaptive(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: isSwitched,
                title: Text("Switch me"),
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                  });
                },
              ),
              Slider.adaptive(
                max: 10.0,
                value: sliderValue,
                divisions: 5,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                  print(value);
                },
              ),
              InkWell(
                splashColor: Colors.teal[600],
                onTap: () {
                  print("Button pressed");
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white12,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Click me"),
              ),
              FilledButton(
                onPressed: () {},
                child: Text("Click me"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Click me"),
              ),
              OutlinedButton(
                onPressed: () {},
                child: Text("Click me"),
              ),
              CloseButton(),
              BackButton(),
              Padding(padding: EdgeInsets.all(20.0)),
            ],
          ),
        ),
      ),
    );
  }
}

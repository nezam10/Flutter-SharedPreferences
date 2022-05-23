import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  String name = "";
  SharedPreferences? prefs;

  // getSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  // }

  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter SharedPreferences"),
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Text(name, style: TextStyle(fontSize: 25, color: Colors.blue)),
                TextButton(
                  onPressed: () {
                    save();
                  },
                  child: Text("Save"),
                ),
                TextButton(
                  onPressed: () {
                    showdata();
                  },
                  child: Text("Show"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  save() async {
    prefs = await SharedPreferences.getInstance();
    prefs?.setString("username", controller.text.toString());
  }

  showdata() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs!.getString("username")!;
    setState(() {});
  }
}

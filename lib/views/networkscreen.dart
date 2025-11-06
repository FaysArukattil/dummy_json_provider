import 'package:dummy_json_provider/services/networkservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:provider/provider.dart';

class Networkscreen extends StatelessWidget {
  const Networkscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final network = Provider.of<NetworkService>(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(child: Text(network.isconnected.toString())),
          Center(child: Text(network.statusMessage)),
          SizedBox(height: 100),

          ElevatedButton(
            onPressed: () {
              SmartDialog.showToast("Hello World");
            },
            child: Text("smartDialoguePackage"),
          ),
          ElevatedButton(
            onPressed: () {
              SmartDialog.show(
                builder: (context) {
                  return AlertDialog(
                    title: Text("Hello World"),
                    actions: [
                      TextButton(
                        child: Text("Close"),
                        onPressed: () {
                          SmartDialog.dismiss();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("smartDialogueLoading"),
          ),
          ElevatedButton(
            onPressed: () {
              SmartDialog.show(
                builder: (context) {
                  return Container(
                    height: 200,
                    width: 200,
                    color: Colors.amber,
                    child: Column(
                      children: [
                        Text("Would you like to continue?"),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                SmartDialog.dismiss();
                              },
                              child: Text("Yes"),
                            ),
                            TextButton(onPressed: () {}, child: Text("No")),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Text("smartDialogueLoading"),
          ),
        ],
      ),
    );
  }
}

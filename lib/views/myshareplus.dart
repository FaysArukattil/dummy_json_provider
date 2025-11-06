import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class Myshareplus extends StatefulWidget {
  const Myshareplus({super.key});

  @override
  State<Myshareplus> createState() => _MyshareplusState();
}

class _MyshareplusState extends State<Myshareplus> {
  ImagePicker imagePicker = ImagePicker();
  XFile? image;
  pickimage() async {
    List<XFile>? data = [];
    var picked = await imagePicker.pickImage(source: ImageSource.camera);
    data.add(picked!);
    setState(() {});
    shareFile(data);
  }

  void shareText(String text) {
    SharePlus.instance.share(ShareParams(text: text));
  }

  void sharelink(String text) {
    SharePlus.instance.share(ShareParams(uri: Uri.parse(text)));
  }

  void shareFile(List<XFile> data) {
    SharePlus.instance.share(ShareParams(files: data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                shareText("hello");
              },
              child: Text("Share Text"),
            ),
            ElevatedButton(
              onPressed: () {
                shareText("https://pub.dev/packages/share_plus");
              },
              child: Text("Share link"),
            ),
            ElevatedButton(
              onPressed: () {
                pickimage();
              },
              child: Text("Share Multiple"),
            ),
          ],
        ),
      ),
    );
  }
}

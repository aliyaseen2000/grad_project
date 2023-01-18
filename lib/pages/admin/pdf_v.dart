import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'show_test.dart';

class PdfViage extends StatefulWidget {
  @override
  String? localPath;

  PdfViage({
    Key? key,
    required this.localPath,
  }) : super(key: key);
  _PdfViageState createState() => _PdfViageState();
}

class _PdfViageState extends State<PdfViage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          " PDF Viewer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => showtest_page()));
          },
        ),
      ),
      body: widget.localPath != null
          ? PDFView(
              filePath: widget.localPath,
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

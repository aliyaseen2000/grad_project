import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'u_result.dart';

class PdfViewerPage extends StatefulWidget {
  @override
  String? localPath;

  PdfViewerPage({
    Key? key,
    required this.localPath,
  }) : super(key: key);
  _PdfViewerPageState createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
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
                MaterialPageRoute(builder: (context) => uresult_page()));
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

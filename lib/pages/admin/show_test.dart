import 'package:flutter/material.dart';
import 'record.dart';
import 'pdf_v.dart';

class showtest_page extends StatefulWidget {
  const showtest_page({Key? key}) : super(key: key);
  @override
  _showtest_pageState createState() => new _showtest_pageState();
}

class _showtest_pageState extends State<showtest_page> {
  List file_name = ["aaa.pdf", "bb.pdf"];

  List file_path = [];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => record_page()));
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.065,
            child: Image.asset(
              'assets/images/hemog_black.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 159, 198, 223),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(1.1, 4.0),
                blurRadius: 8.0),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(45, 25, 15, 0),
              child: Text(
                "All the Test you have are listed below: ",
                style: TextStyle(
                    color: Color.fromARGB(255, 9, 78, 153),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            for (int i = 0; i < file_name.length; i++) result(context, i)
          ]),
        ),
      ),
    );
  }

  Widget result(BuildContext context, int i) {
    return Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.07,
            right: MediaQuery.of(context).size.width * 0.07,
            top: MediaQuery.of(context).size.width * 0.03,
            bottom: MediaQuery.of(context).size.width * 0.03),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(1.1, 4.0),
                  blurRadius: 8.0),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 0, 0),
                  child: Text(
                    file_name[i],
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(70, 15, 0, 0),
                  child: Container(
                    //decoration: ThemeHelper().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.only(
                              left: 10, right: 10, top: 0, bottom: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Color(0xFFFB475F).withOpacity(.65)),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: Text(
                          "Show",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () async {
                        PdfViage(
                          localPath: file_path[i],
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ));
  }
}

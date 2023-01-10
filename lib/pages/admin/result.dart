import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad_proj/pages/admin/admin_home.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '../../common/theme_helper.dart';
import 'package:file_picker/file_picker.dart';

class result_page extends StatefulWidget {
  const result_page({Key? key}) : super(key: key);
  @override
  _result_pageState createState() => new _result_pageState();
}

class _result_pageState extends State<result_page> {
  File? file;
  var fileName = '';

  var path = '';

  void pick() async {
    try {
      final resultt = await FilePicker.platform
          .pickFiles(type: FileType.any, allowMultiple: false);
      setState(() {
        if (resultt != null) {
          var fileBytes = resultt.files.first.bytes;
          fileName = resultt.files.first.name;
          path = resultt.files.first.path!;
        }
        file = File(path);
        print(file);
      });

      // }
    } catch (e) {
      print(e);
    }
  }

  List<String> Patient = [
    'Ahmad',
    'Ali',
    'Ahmad',
    'Ali',
  ];
  String selected_patient = '';
  TextEditingController searchControler = TextEditingController();
  double h = 150;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => admin_homepage()));
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
          color: Color.fromARGB(255, 255, 255, 255),
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
          child: Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.092,
                    right: MediaQuery.of(context).size.width * 0.092,
                    bottom: MediaQuery.of(context).size.width * 0.092,
                    top: 50),
                child: Text(
                  'Select the patient you want to send the results to',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                    color: Color.fromARGB(255, 0, 78, 153),
                  ),
                ),
              ),
              Container(
                width: 310,
                padding: EdgeInsets.fromLTRB(25, 120, 5, 0),
                child: DropdownSearch<String>(
                  mode: Mode.MENU,
                  maxHeight: 300,
                  showSearchBox: true,
                  items: Patient,
                  showSelectedItems: false,
                  selectedItem: '',
                  //save selected list
                  onChanged: (value) {
                    selected_patient = value!;
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(30, 180, 0, 0),
                    child: Text(
                      'Pick the result you wanna send ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.width * 0.050,
                        color: Color.fromARGB(255, 0, 78, 153),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 180, 35, 0),
                    child: IconButton(
                      icon: Icon(
                        Icons.file_upload_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        pick();
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(115, 230, 0, 0),
                child: Text(
                  fileName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    color: Color.fromARGB(255, 0, 78, 153),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 320, 0, 0),
                child: Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

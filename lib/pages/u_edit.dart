import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import '../../common/theme_helper.dart';
import 'u_setting.dart';

class u_edit_page extends StatefulWidget {
  const u_edit_page({Key? key}) : super(key: key);
  @override
  _u_edit_pageState createState() => new _u_edit_pageState();
}

class _u_edit_pageState extends State<u_edit_page> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstNameControler = TextEditingController();
  TextEditingController lastnameControler = TextEditingController();
  TextEditingController AgeControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();

  File? _image;
  @override
  void initState() {
    firstNameControler.text = "Ahmad";
    lastnameControler.text = "Ahmad";
    AgeControler.text = "Nablus Rafidea";
    phoneControler.text = "0595585652";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
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
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => Setting_Screen()));
          },
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.092),
                child: Text(
                  'Edit Your Information',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    letterSpacing: 0.5,
                    color: Color.fromARGB(255, 15, 15, 15),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: firstNameControler,
                        decoration:
                            ThemeHelper().textInputDecoration('First Name', ''),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: lastnameControler,
                        decoration:
                            ThemeHelper().textInputDecoration('Last Name', ''),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: AgeControler,
                        decoration:
                            ThemeHelper().textInputDecoration("Age", ""),
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: phoneControler,
                        decoration: ThemeHelper().textInputDecoration(
                            "Mobile Number", "Enter your mobile number"),
                        keyboardType: TextInputType.phone,
                        validator: (val) {
                          if (!(val!.isEmpty) &&
                              !RegExp(r"^(\d+)*$").hasMatch(val)) {
                            return "Enter a valid phone number";
                          }
                          return null;
                        },
                      ),
                      decoration: ThemeHelper().inputBoxDecorationShaddow(),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                          child: Text(
                            "Save",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Setting_Screen()),
                                (Route<dynamic> route) => false);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> bottomSheet(
    BuildContext context,
    Widget child,
  ) {
    return showModalBottomSheet(
        isScrollControlled: false,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(13), topRight: Radius.circular(13))),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Container(
            height: MediaQuery.of(context).size.height / 3, child: child));
  }
}

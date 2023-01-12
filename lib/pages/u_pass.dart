import 'package:flutter/material.dart';
import 'package:grad_proj/pages/admin/setting.dart';

import '../../common/theme_helper.dart';

class u_password extends StatefulWidget {
  const u_password({Key? key}) : super(key: key);
  @override
  _u_passwordState createState() => new _u_passwordState();
}

class _u_passwordState extends State<u_password> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController oldu_passwordControler = TextEditingController();
  TextEditingController newu_passwordControler = TextEditingController();
  TextEditingController confirmu_passwordControler = TextEditingController();

  String u_password = "123456"; //from database
  @override
  Widget build(BuildContext context) {
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
                  MaterialPageRoute(builder: (context) => Settings_Screen()));
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
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.092,
                        right: MediaQuery.of(context).size.width * 0.092,
                        bottom: MediaQuery.of(context).size.width * 0.092,
                        top: MediaQuery.of(context).size.width * 0.3),
                    child: Text(
                      'Reset u_password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * 0.07,
                        letterSpacing: 0.5,
                        color: Color.fromARGB(255, 15, 15, 15),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: oldu_passwordControler,
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("u_password*", ""),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your u_password";
                              }
                              if (u_password != oldu_passwordControler.text) {
                                return "Wrong old u_password ";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: newu_passwordControler,
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("u_password*", ""),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your u_password";
                              }

                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          alignment: Alignment.center,
                          child: TextFormField(
                            controller: confirmu_passwordControler,
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("Confirm u_password*", ""),
                            validator: (val) {
                              if (confirmu_passwordControler.text !=
                                  newu_passwordControler.text) {
                                return "Check u_password must be the same for new u_password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: 20, top: 40, left: 15),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Settings_Screen()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                              minimumSize:
                                  MaterialStateProperty.all(Size(280, 50)),
                              backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 159, 198, 223),
                              ),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: Text('Reset',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.062,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

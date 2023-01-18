import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad_proj/pages/admin/admin_home.dart';
import 'package:grad_proj/pages/admin/show_test.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '../../common/theme_helper.dart';

class record_page extends StatefulWidget {
  const record_page({Key? key}) : super(key: key);
  @override
  _record_pageState createState() => new _record_pageState();
}

class _record_pageState extends State<record_page> {
  //عليك تجييب كل المرضى ومعلوماتهم وتعبيهم بليست يلي تحت
  List<String> user_name = [
    'Ahmad',
    'Ali',
    'Ahmad',
    'Ali',
  ];
  List<String> fullname = [
    'Ahmad ',
    'Ali yaseen',
    'Ahmad dff',
    'Ali',
  ];
  List<String> id = [
    '111111',
    '000000',
    '2222222',
    '102555555',
  ];
  List<int> age = [
    20,
    22,
    23,
    12,
  ];
  List<String> phone = [
    "092396420",
    "092396420",
    "092396420",
    "092396420",
  ];
  // 2d list
  List<List> selected_test = [
    [
      'ggga',
      "Professional ",
    ],
    [
      'gggj',
      "Professional ",
    ],
    [
      'ggmg',
      "Professional ",
    ],
    [
      'ggbg',
      "Professional ",
    ]
  ];

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
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.092),
                child: Text(
                  'Find out if your patient has a record by searching',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: MediaQuery.of(context).size.width * 0.045,
                    color: Color.fromARGB(255, 0, 78, 153),
                  ),
                ),
              ),
              Row(children: [
                Container(
                  width: 310,
                  padding: EdgeInsets.fromLTRB(25, 100, 0, 0),
                  child: TextFormField(
                    controller: searchControler,
                    decoration: ThemeHelper().textInputDecoration(
                        'Search', 'search by enter patient name'),
                  ),
                  decoration: ThemeHelper().inputBoxDecorationShaddow(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 100, 25, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      if (searchControler.text.isNotEmpty)
                        for (int i = 0; i < user_name.length; i++) {
                          if (searchControler.text.toLowerCase() ==
                              user_name[i].toLowerCase())
                            showAlertDialog(context, i);
                        }
                    },
                  ),
                ),
              ]),
              Padding(
                  padding: EdgeInsets.fromLTRB(35, 170, 10, 0),
                  child: Laboratory(context, MediaQuery.of(context).size)),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, MediaQuery.of(context).size.height * 1.5, 0, 0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Laboratory(BuildContext context, Size size) {
    h = 150;
    for (int j = 0; j < user_name.length; j++) {
      h = h + 50;
    }
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        width: size.width * 0.8,
        height: h,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 159, 198, 223),
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
        child: Column(children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(15, 20, 10, 20),
            child: Text(
              'Patients Record',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: MediaQuery.of(context).size.width * 0.053,
                  fontWeight: FontWeight.w700),
            ),
          ),
          for (int i = 0; i < user_name.length; i++) patient(context, size, i)
        ]),
      ),
    );
  }

  Widget patient(BuildContext context, Size size, int i) {
    return Stack(children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
        child: Text(
          user_name[i],
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(180, 15, 20, 10),
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: 'Results',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => showtest_page()));
              },
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.037,
                fontWeight: FontWeight.w500),
          ),
        ])),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(240, 15, 0, 10),
        child: Text.rich(TextSpan(children: [
          TextSpan(
            text: 'Details',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                showAlertDialog(context, i);
              },
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: MediaQuery.of(context).size.width * 0.037,
                fontWeight: FontWeight.w500),
          ),
        ])),
      ),
    ]);
  }

  showAlertDialog(BuildContext context, int k) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 0.43,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.004),
                    IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xff132137),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      fullname[k],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                          child: Text(
                            "User name:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                          child: Text(
                            user_name[k],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 9, 78, 153),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Age:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            age[k].toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 9, 78, 153),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Identity Number:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            id[k],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 9, 78, 153),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: Text(
                            "Mobile Number:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                          child: Text(
                            phone[k],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 9, 78, 153),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30, 25, 40, 0),
                      child: Container(
                        //decoration: ThemeHelper().buttonBoxDecoration(context),
                        child: ElevatedButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: 10, right: 10, top: 0, bottom: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor:
                                  Color(0xFFFB475F).withOpacity(.65)),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              "Show Tests",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => showtest_page()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

double ttop = 0;
Widget text_wed(BuildContext context, String s, int i) {
  if (i != 0) ttop = ttop + 0;
  if (i == 0) ttop = 10;
  return Padding(
    padding: EdgeInsets.only(left: 10, top: ttop),
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Text(
        s,
        textAlign: TextAlign.left,
        style: TextStyle(
            color: Color.fromARGB(255, 9, 78, 153),
            fontSize: MediaQuery.of(context).size.width * 0.04,
            fontWeight: FontWeight.w500),
      ),
    ),
  );
}

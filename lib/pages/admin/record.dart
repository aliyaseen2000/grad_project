import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad_project/pages/admin/admin_home.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import '../../common/theme_helper.dart';

class record_page extends StatefulWidget {
  const record_page({Key? key}) : super(key: key);
  @override
  _record_pageState createState() => new _record_pageState();
}

class _record_pageState extends State<record_page> {
  List<String> user_name = [
    'Ahmad',
    'Ali',
    'Ahmad',
    'Ali',
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
                      print(searchControler.text);
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
        padding: EdgeInsets.only(left: 10, top: 10, right: 50, bottom: 10),
        child: Text(
          user_name[i],
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: MediaQuery.of(context).size.width * 0.05,
              fontWeight: FontWeight.w700),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(160, 13, 0, 10),
        child: Text(
          ' Show Details',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: MediaQuery.of(context).size.width * 0.037,
              fontWeight: FontWeight.w500),
        ),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(230, 0, 0, 10),
        child: IconButton(
          icon: Icon(
            Icons.arrow_forward_ios,
            size: 15,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            print(searchControler.text);
          },
        ),
      ),
    ]);
  }
}

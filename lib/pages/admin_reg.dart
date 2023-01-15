import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grad_project/pages/splash_screen.dart';
import 'package:grad_project/pages/widgets/header_widget.dart';
import '../common/theme_helper.dart';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'select_photo_options_screen.dart';

class Lab_Registration extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Lab_RegistrationState();
  }
}

class _Lab_RegistrationState extends State<Lab_Registration> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController TimeInput1 = TextEditingController();
  TextEditingController TimeInput2 = TextEditingController();

   List<String> Insurance = [
    'Nat Health (الوطنية)',
    'Globe Med (العالمية)',
    'Smart Health (ترست)',
    'Tamkeen (تمكين)',
    'Med Service (المشرق)',
  ];

  List<String> selected_Insurance = [];

  String Beg_time = "";
  String End_time = "";

  Duration initialtimer = new Duration();
  File? _image;

  TextEditingController LabNameControler = TextEditingController();
  TextEditingController usernameControler = TextEditingController();
  TextEditingController LocationControler = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController passwordControler = TextEditingController();
  TextEditingController confirmPasswordControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 150,
              child: HeaderWidget(
                  150, false, Icons.person_add_alt_1_rounded, '', false),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                          top: 70,
                        )),
                        Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Center(
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                _showSelectPhotoOptions(context);
                              },
                              child: Center(
                                child: Container(
                                    height: 150.0,
                                    width: 150.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey.shade200,
                                    ),
                                    child: Center(
                                      child: _image == null
                                          ? Icon(
                                              Icons.person_add_alt_1_rounded,
                                              color: Colors.black,
                                              size: 40.0,
                                            )
                                          : CircleAvatar(
                                              backgroundImage:
                                                  FileImage(_image!),
                                              radius: 150.0,
                                            ),
                                    )),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 140),
                          child: Text(
                            'Add new Lab:',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.055,
                              letterSpacing: 0.5,
                              color: Color.fromARGB(255, 0, 78, 153),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: TextFormField(
                            controller: LabNameControler,
                            decoration: ThemeHelper()
                                .textInputDecoration('Lab Name', ''),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                            controller: usernameControler,
                            decoration: ThemeHelper()
                                .textInputDecoration('User Name', ''),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: LocationControler,
                            decoration: ThemeHelper()
                                .textInputDecoration("Location", ""),
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
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
                          child: TextFormField(
                            controller: passwordControler,
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("Password*", ""),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: confirmPasswordControler,
                            obscureText: true,
                            decoration: ThemeHelper()
                                .textInputDecoration("Confirm Password*", ""),
                            validator: (val) {
                              if (confirmPasswordControler.text !=
                                  passwordControler.text) {
                                return "Please check your password";
                              }
                              return null;
                            },
                          ),
                          decoration: ThemeHelper().inputBoxDecorationShaddow(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 2, right: 7),
                          child: TextField(
                              controller: TimeInput1,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer_sharp,
                                    color: Color.fromARGB(255, 0, 78, 153),
                                  ),
                                  labelText:
                                      "Enter Beginning Time" //label text of field
                                  ),
                              readOnly: true,
                              onTap: () async {
                                await bottomSheet(context, timePicker1());
                                setState(() {
                                  TimeInput1.text = Beg_time;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5, left: 2, right: 7),
                          child: TextField(
                              controller: TimeInput2,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.timer_sharp,
                                    color: Color.fromARGB(255, 0, 78, 153),
                                  ),
                                  labelText:
                                      "Enter End Time" //label text of field
                                  ),
                              readOnly: true,
                              onTap: () async {
                                await bottomSheet(context, timePicker2());
                                setState(() {
                                  TimeInput2.text = End_time;
                                });
                              }),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 7, top: 5, left: 10),
                          child: DropdownSearch<String>.multiSelection(
                            mode: Mode.MENU,
                            maxHeight: 400,
                            showSearchBox: true,

                            dropdownSearchDecoration: InputDecoration(
                              fillColor: Colors.white,
                              labelText: " Insurance",
                              hintText: "Select Insurance",
                            ),
                            items: Insurance,
                            showSelectedItems: false,
                            selectedItems: [],
                            //save selected list
                            onChanged: (value) {
                              selected_Insurance = value;
                            },
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Add",
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
                                        builder: (context) => SplashScreen(
                                              title: '',
                                            )),
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
          ],
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

  Widget timePicker1() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 15,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          Beg_time = changedtimer.inHours.toString() +
              ':' +
              (changedtimer.inMinutes % 60).toString();
        });
      },
    );
  }

  Widget timePicker2() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hm,
      minuteInterval: 15,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          End_time = changedtimer.inHours.toString() +
              ':' +
              (changedtimer.inMinutes % 60).toString();
        });
      },
    );
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  Future _pickImage(ImageSource source) async {
    try {
      final XFile? image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      print("helloooooo");
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        //  Navigator.of(context).pop();
      });
    } on Exception catch (e) {
      print(e);
      //Navigator.of(context).pop();
    }
  }
}

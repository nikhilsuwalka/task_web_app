import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:task_web_app/Models/Detailtems.dart';
import 'package:task_web_app/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:task_web_app/Utills/MyColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstName = TextEditingController(text: "");
  final TextEditingController _lastName = TextEditingController(text: "");
  final TextEditingController _mobile = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  List detailList = [];
  int _itemCount = 3;
  double _cardHeight = 60;
  double _TxtfontSize = 15;
  double _BtnfontSize = 18;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _firstName.dispose();
    _lastName.dispose();
    _mobile.dispose();
    super.dispose();
  }

  _submit(BuildContext context) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      setState(() {
        DetailItems dt =
            new DetailItems(_firstName.text, _lastName.text, _mobile.text);
        detailList.add(dt);
        _firstName.text = "";
        _lastName.text = "";
        _mobile.text = "";
      });
    }
  }

  Widget webDisplay() {
    return Column(children: [
      Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is Mandatory";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          filled: true,
                          labelText: "First Name",
                          labelStyle: TextStyle(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                          ),
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          hintText: "First Name"),
                      controller: _firstName,
                      style: TextStyle(
                        fontSize: _TxtfontSize,
                        color: MyColors.colorConvert(MyColors.colorPrimary),
                      ),
                    ),
                    flex: 1,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is Mandatory";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          labelText: "Last Name",
                          labelStyle: TextStyle(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          hintText: "Last Name"),
                      controller: _lastName,
                      style: TextStyle(
                        fontSize: _TxtfontSize,
                        color: MyColors.colorConvert(MyColors.colorPrimary),
                      ),
                    ),
                    flex: 1,
                  )
                ]),
            SizedBox(
              height: 15,
            ),
            Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Field is Mandatory";
                        } else if (value.length != 10) {
                          return "Invalid Mobile Number";
                        }
                        return null;
                      },
                      decoration: new InputDecoration(
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                          ),
                          filled: true,
                          counterText: "",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.colorConvert(
                                    MyColors.colorPrimary),
                                width: 2.0),
                          ),
                          hintText: "Mobile Number"),
                      controller: _mobile,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        fontSize: _TxtfontSize,
                        color: MyColors.colorConvert(MyColors.colorPrimary),
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(),
                    flex: 1,
                  )
                ]),
            SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: InkWell(
                  onTap: () {
                    _submit(context);
                  },
                  child: Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: MyColors.colorConvert(MyColors.yellow)),
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: _BtnfontSize,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

  Widget mobileView() {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                  child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Field is Mandatory";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      color: MyColors.colorConvert(MyColors.colorPrimary),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 1.0, color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: MyColors.colorConvert(MyColors.colorPrimary),
                          width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: MyColors.colorConvert(MyColors.colorPrimary),
                          width: 2.0),
                    ),
                    hintText: "First Name"),
                controller: _firstName,
                style: TextStyle(
                  fontSize: _TxtfontSize,
                  color: MyColors.colorConvert(MyColors.colorPrimary),
                ),
              )),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is Mandatory";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: new InputDecoration(
                      labelText: "Last Name",
                      labelStyle: TextStyle(
                        color: MyColors.colorConvert(MyColors.colorPrimary),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderSide:
                              new BorderSide(width: 1.0, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                            width: 2.0),
                      ),
                      hintText: "Last Name"),
                  controller: _lastName,
                  style: TextStyle(
                    fontSize: _TxtfontSize,
                    color: MyColors.colorConvert(MyColors.colorPrimary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is Mandatory";
                    } else if (value.length != 10) {
                      return "Invalid Mobile Number";
                    }
                    return null;
                  },
                  decoration: new InputDecoration(
                      labelText: "Mobile Number",
                      labelStyle: TextStyle(
                        color: MyColors.colorConvert(MyColors.colorPrimary),
                      ),
                      filled: true,
                      counterText: "",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderSide:
                              new BorderSide(width: 1.0, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                            width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: MyColors.colorConvert(MyColors.colorPrimary),
                            width: 2.0),
                      ),
                      hintText: "Mobile Number"),
                  controller: _mobile,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  style: TextStyle(
                    fontSize: _TxtfontSize,
                    color: MyColors.colorConvert(MyColors.colorPrimary),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: InkWell(
                    onTap: () {
                      _submit(context);
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: MyColors.colorConvert(MyColors.yellow)),
                      child: Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: _BtnfontSize,
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _gridView() {
    return Container(
      // height: MediaQuery.of(context).size.height - 230,
      child: detailList.length > 0
          ? GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                      crossAxisCount: _itemCount,
                      // childAspectRatio: 1.3
                      height: _cardHeight),
              itemCount: detailList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return CardItem(detailList[index]);
              })
          // ListView.builder(
          //         shrinkWrap: true,
          //         itemCount: detailList.length,
          //         itemBuilder: (BuildContext context, int index) {
          //           return CardItem(detailList[index]);
          //         },
          //       )
          : Container(),
    );
  }

  CardItem(DetailItems detList) {
    return Card(
      elevation: 5,
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(children: [
              Flexible(
                child: Text(
                  "Name : " + detList.fname + " " + detList.lname,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: _TxtfontSize,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
            Row(children: [
              Flexible(
                child: Text(
                  "Mobile : " + detList.mobile,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: _TxtfontSize,
                    color: Colors.black,
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double Swidth = MediaQuery.of(context).size.width;
    double Sheight = MediaQuery.of(context).size.height;

    setState(() {
      if (Swidth < 600) {
        //for Mobile
        _itemCount = 2;
        _cardHeight = 100;
        _TxtfontSize = 13;
        _BtnfontSize = 16;
      } else if (Swidth < 1100 && Swidth >= 600) {
        //for Tablet
        _itemCount = 3;
        _cardHeight = 130;
        _TxtfontSize = 15;
        _BtnfontSize = 18;
      } else if (Swidth >= 1100) {
        // for Desktop
        _itemCount = 4;
        _cardHeight = 150;
        _TxtfontSize = 18;
        _BtnfontSize = 20;
      }
    });

    return Column(
      children: [
        ScreenTypeLayout(
          mobile: mobileView(),
          desktop: webDisplay(),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(child: _gridView())
      ],
    );
  }
}

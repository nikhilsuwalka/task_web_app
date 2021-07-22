import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Models/Detailtems.dart';
import 'Models/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _firstName = TextEditingController(text: "");
  final TextEditingController _lastName = TextEditingController(text: "");
  final TextEditingController _mobile = TextEditingController(text: "");
  final _formKey = GlobalKey<FormState>();
  List detailList = [];
  int _itemCount = 3;

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
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          hintText: "First Name"),
                      controller: _firstName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
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
                          filled: true,
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          hintText: "Last Name"),
                      controller: _lastName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
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
                          filled: true,
                          counterText: "",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                              borderSide: new BorderSide(
                                  width: 1.0, color: Colors.grey)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          hintText: "Mobile Number"),
                      controller: _mobile,
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
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
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.teal),
                    child: Center(
                        child: Text(
                      "Add",
                      style: TextStyle(
                        fontSize: 20,
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
                    filled: true,
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(width: 1.0, color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    hintText: "First Name"),
                controller: _firstName,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
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
                      filled: true,
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderSide:
                              new BorderSide(width: 1.0, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: "Last Name"),
                  controller: _lastName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
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
                      filled: true,
                      counterText: "",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                          borderSide:
                              new BorderSide(width: 1.0, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: "Mobile Number"),
                  controller: _mobile,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
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
                          color: Colors.teal),
                      child: Center(
                          child: Text(
                        "Add",
                        style: TextStyle(
                          fontSize: 20,
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
                      height: 80),
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
                    fontSize: 15,
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
                    fontSize: 15,
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
      if (Swidth > 600)
        _itemCount = 4;
      else
        _itemCount = 2;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.all(10),
          child: Center(
            child: Column(children: [
              (Swidth > 600) ? webDisplay() : mobileView(),
              Expanded(
                child: _gridView(),
              ),
            ]),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

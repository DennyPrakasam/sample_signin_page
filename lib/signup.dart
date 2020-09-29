import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:sign_up/profiledetails.dart';
//import 'package:sign_up/objectlist.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpScreen();
}

class SignUpScreen extends State<SignUp> {
  String fname;
  final TextEditingController _fname = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _cpwd = TextEditingController();
  bool checkboxValue = false;
  // UserModel usr = new UserModel();
  String key;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  File _image;
  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text('Thanks for Sign Up'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e5e8),
      bottomNavigationBar: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(color: Colors.black12),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              //child: Text('Home'),
              child: Row(
                children: <Widget>[
                  Icon(Icons.home),
                  Text('Home'),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(color: Colors.black26),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              //child: Text('Sign Up'),
              //child: Icon(Icons.add_circle),
              child: Row(
                children: <Widget>[
                  Icon(Icons.add_circle_outline),
                  Text('Sign Up'),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Center(
          child: Form(
            key: _formKey,
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  //Image
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Image(
                      image: AssetImage('assets/images/OdoxSoftHub.png'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),

                  //Profile Pic
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: ClipRRect(
                            child: _image == null
                                ? Text('No image selected.')
                                : new CircleAvatar(
                                    backgroundImage: new FileImage(_image),
                                    radius: 40.0),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.02,
                        ),
                        FloatingActionButton(
                          onPressed: pickImage,
                          tooltip: 'Pick Image',
                          child: Icon(Icons.add_a_photo),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //First Name
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      //controller: ,
                      onChanged: (value) =>
                          ProfileDetails.name[ProfileDetails.id] = value,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'First Name is Required';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //Second Name
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Second Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Last Name is Required';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //Email
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value.isEmpty) return 'Email Address is Required';
                        if (!RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                          return 'Please enter a valid email Address';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //Phone Number
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        String pattern = r'^(?:[+0]9)?[0-9]{10}$';
                        RegExp regExp = new RegExp(pattern);
                        if (value.isEmpty) return 'Phone Number is Required';
                        if (!regExp.hasMatch(value))
                          return 'Please enter valid mobile number';
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //Password
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      onChanged: (value) =>
                          ProfileDetails.pwd[ProfileDetails.id] = value,
                      controller: _pwd,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.lock_open),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Password is Required';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //Confirm Password
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: _cpwd,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        icon: Icon(Icons.lock_open),
                      ),
                      validator: (value) {
                        if (value.isEmpty) return 'Password is Required';
                        if (value != _pwd.text) return 'Password is Wrong';
                        return null;
                      },
                      onSaved: (String value) {
                        fname = value;
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),

                  //Term & Conditions
                  Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: CheckboxListTile(
                        title: Text('Agree to Terms and Conditions'),
                        value: checkboxValue,
                        onChanged: (val) {
                          if (checkboxValue == false) {
                            setState(() {
                              checkboxValue = true;
                            });
                          } else if (checkboxValue == true) {
                            setState(() {
                              checkboxValue = false;
                            });
                          }
                        },
                        subtitle: !checkboxValue
                            ? Text(
                                'Required.',
                                style: TextStyle(color: Colors.red),
                              )
                            : null,
                        // title: new Text(
                        //   'I agree.',
                        //   style: TextStyle(fontSize: 14.0),
                        // ),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: Colors.green,
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  //SignUp Button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      onPressed: () {
                        print('Sign Up');
                        if (!_formKey.currentState.validate()) {
                          return null;
                        } else {
                          _formKey.currentState.save();
                          ProfileDetails.id += 1;
                          print(ProfileDetails.name);
                          print(ProfileDetails.id);
                          return createAlertDialog(context);
                        }
                      },
                      color: Colors.amberAccent,
                      textColor: Colors.black,
                      child: Text('Sign UP'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ]),
          ),
        )),
      ),
    );
  }
}

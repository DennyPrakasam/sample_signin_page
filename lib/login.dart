import 'package:flutter/material.dart';
import 'package:sign_up/profiledetails.dart';

class SignIn extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignInScreen();
  }
}

class SignInScreen extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e5e8),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Image(
                      image: AssetImage('assets/images/OdoxSoftHub.png'),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      validator: (value) {
                        if (ProfileDetails.name.values
                            .toList()
                            .contains(value)) {
                          id = ProfileDetails.name.values
                                  .toList()
                                  .indexOf(value) +
                              2;
                        } else
                          return 'Not a Valid user';
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                      validator: (value) {
                        if (id == null) {
                          return "Incorrect Username or Password";
                        } else {
                          if (ProfileDetails.pwd[id] == value) {
                            print(ProfileDetails.name);
                            print(value);
                            print(id);
                            print(ProfileDetails.id);
                            print('Correct Password');
                          } else {
                            //return "Incorrect Password";
                            print(ProfileDetails.name);
                            print(ProfileDetails.pwd);
                            print(value);
                            print(id);
                            print(ProfileDetails.id);
                            print('Incorrect Password');
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Sign In'),
                                  content: Text('Sign In Successful'),
                                  actions: [
                                    FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.pop(context);
                                          Navigator.pushNamed(context, "/");
                                        },
                                        child: Text("Ok")),
                                  ],
                                );
                              });
                        }
                      },
                      color: Colors.amberAccent,
                      textColor: Colors.black,
                      child: Text('Sign In'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: RaisedButton(
                      onPressed: () {
                        //return SignUpScreen();
                        Navigator.pushNamed(context, '/SignUp');
                      }, // SignUpScreen(),
                      color: Colors.amberAccent,
                      textColor: Colors.black,
                      child: Text('Sign UP'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Text(
                    'Forgot Password',
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(color: Colors.black26),
            child: FlatButton(
              onPressed: () {},
              //child: Icon(Icons.home),
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
            decoration: BoxDecoration(color: Colors.black12),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              //child: Text('Sign Up'),
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
    );
  }
}

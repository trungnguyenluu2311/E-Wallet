import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateAccount extends StatefulWidget {
  //const CreateAccount({Key key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  Future<void> _alterDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Close Dialog"))
            ],
          );
        });
  }

  //Create a new user
  Future<String> _createAccount() async {
    try {
      UserCredential _authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _registerEmail, password: _registerPassword);
      if (_authResult != null && _authResult.user != null) {
        try {
          UserModel user = UserModel(
            id: _authResult.user.uid,
            email: _authResult.user.email,
            name: _registerName,
            idwallet: "nonewallet",
          );
          await FirebaseFirestore.instance.collection("users").doc(user.id).set({
            "id": user.id,
            "name": user.name,
            "email": user.email,
            "idwallet": user.idwallet,
          });
        } catch (e) {
          return e.toString();
        }
      }
      return "success";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provieded is too weak';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    if(_registerName ==""){
      _alterDialogBuilder("Your Full name was blank");
    }
    else if(_registerEmail==""){
      _alterDialogBuilder("Your Email was blank");
    }
    else if(_registerPassword==""){
      _alterDialogBuilder("Your Password was blank");
    }
    else if(_registerconfirmPassword==""){
      _alterDialogBuilder("Your Confirm password was blank");
    }
    else if(_registerPassword != _registerconfirmPassword){
      _alterDialogBuilder("Confirm password does not match");
    }
    else{
      setState(() {
        _registerFormLoading = true;
      });

      //run a create method
      String _createAccountFeedback = (await _createAccount());

      if (_createAccountFeedback != "success") {
        _alterDialogBuilder(_createAccountFeedback);

        setState(() {
          _registerFormLoading = false;
        });
      }
      else {
        Navigator.pop(context);
      }
    }
  }

  bool _registerFormLoading = false;
  late FocusNode _nameFocusNode;
  late FocusNode _EmailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  String _registerName = "";
  String _registerEmail = "";
  String _registerPassword = "";
  String _registerconfirmPassword = "";

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _nameFocusNode = FocusNode();
    _EmailFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _nameFocusNode.dispose();
    _EmailFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 16),
                  Text('Please sign up to continue',
                      style: TextStyle(
                          color: Color(0xFF787878),
                          fontFamily: 'RobotoSlab',
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 66),
                  CustomInput(
                    onChange: (value) {
                      _registerName = value;
                    },
                    onSubmitted: (value) {
                      _EmailFocusNode.requestFocus();
                    },
                    hintText: "Full Name",
                    textInputAction: TextInputAction.next, isPasswordField: false, focusNode:_nameFocusNode ,
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    onChange: (value) {
                      _registerEmail = value;
                    },
                    onSubmitted: (value) {
                      _passwordFocusNode.requestFocus();
                    },
                    hintText: "Email",
                    textInputAction: TextInputAction.next, focusNode: _EmailFocusNode, isPasswordField: false,
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    isPasswordField: true,
                    onChange: (value) {
                      _registerPassword = value;
                    },
                    onSubmitted: (value) {
                      _confirmPasswordFocusNode.requestFocus();
                    },
                    hintText: "Password", textInputAction: TextInputAction.next, focusNode: _passwordFocusNode,
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    isPasswordField: true,
                    onChange: (value) {
                      _registerconfirmPassword = value;
                    },
                    focusNode: _confirmPasswordFocusNode,
                    onSubmitted: (value) {
                      _submitForm();
                    },
                    hintText: "Password", textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    OutlinedButton(
                        onPressed: () {_submitForm();},
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(color: Colors.red)),
                          backgroundColor: Color(0xFFF40057),
                        ),
                        child: Container(
                          padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                          child: Row(
                            children: [
                              Text(
                                'CREATE',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'RobotoSlab',
                                    fontWeight: FontWeight.w700),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 28,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )),
                  ]),
                  SizedBox(height: 66),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Already have an account?",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFFCCCCCC),
                                fontFamily: 'RobotoSlab',
                                fontWeight: FontWeight.w700),
                            children: <TextSpan>[
                              TextSpan(
                                text: " Sign in",
                                style: TextStyle(
                                    color: Color(0xFFCC0047),
                                    fontWeight: FontWeight.w500),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

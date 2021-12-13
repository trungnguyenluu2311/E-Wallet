import 'package:e_wallet/models/user_model.dart';
import 'package:e_wallet/screen/signin_signup_screen/create_account.dart';
import 'package:e_wallet/widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  Future<void> _alertDialogBuilder(String error) async {
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
                child: Text("Close Dialog"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
    );
  }

  // Create a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return "success";
    } on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> googleSignIn() async {
    try {
      GoogleSignInAccount googleSignInAccount = await GoogleSignIn().signIn();
      GoogleSignInAuthentication googleAuth =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential user = await FirebaseAuth.instance.signInWithCredential(credential);
      await FirebaseFirestore.instance.collection("users").doc(user.user.uid).get().then((value) async {
        if(!value.exists){
          UserModel users = UserModel(
            id: user.user.uid,
            email: user.user.email,
            name: user.user.displayName,
            idwallet: "nonewallet",
          );
          await FirebaseFirestore.instance.collection("users").doc(users.id).set({
            "id": users.id,
            "name": users.name,
            "email": users.email,
            "idwallet": users.idwallet,
          });
        }
        else{
          print("user name: ${user.user.displayName}");
          print("user name: ${user.user.uid}");
        }
      });
      return "success";
    } catch (error) {
      return error.toString();
    }
  }

  void _submitGoogle() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = (await googleSignIn());

    // If the string is not null, we got error while create account.
    if(_loginFeedback != "success") {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = (await _loginAccount());

    // If the string is not null, we got error while create account.
    if(_loginFeedback != "success") {
      _alertDialogBuilder(_loginFeedback);

      // Set the form to regular state [not loading].
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  // Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  late FocusNode _passwordFocusNode;
  late FocusNode _emailFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                  'Log in',
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
                    hintText: "Email...",
                    onChange: (value){
                      _loginEmail=value;
                    },
                    onSubmitted: (value){
                      _passwordFocusNode.requestFocus();
                    },
                    textInputAction: TextInputAction.next, isPasswordField: false, focusNode: _emailFocusNode,
                  ),
                  SizedBox(height: 16),
                  CustomInput(
                    hintText: "Password...",
                    onChange: (value){
                      _loginPassword=value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value){
                      _submitForm();
                    }, textInputAction: TextInputAction.done,
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
                                'LOGIN',
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
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.9 ,
                    child: OutlineButton.icon(
                      label: Text(
                        'Sign In With Google',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      shape: StadiumBorder(),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      highlightedBorderColor: Colors.white,
                      borderSide: BorderSide(color: Colors.white),
                      textColor: Color(0xFFCC0047),
                      icon: FaIcon(FontAwesomeIcons.google, color: Color(0xFFCC0047)),
                      onPressed: () {
                        _submitGoogle();
                      },
                    ),
                  ),
              SizedBox(height: 66),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                },
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        children: <TextSpan>[
                          TextSpan(
                            text: " Sign up",
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

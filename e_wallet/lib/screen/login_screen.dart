import 'package:e_wallet/screen/create_account.dart';
import 'package:e_wallet/widget/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
      return null;
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

  void _submitForm() async {
    // Set the form to loading state
    setState(() {
      _loginFormLoading = true;
    });

    // Run the create account method
    String _loginFeedback = await _loginAccount();

    // If the string is not null, we got error while create account.
    if(_loginFeedback != null) {
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
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
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
              textInputAction: TextInputAction.next,
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
              },
            ),
            SizedBox(height: 16),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              OutlinedButton(
                  onPressed: () {},
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
      )),
    );
  }
}

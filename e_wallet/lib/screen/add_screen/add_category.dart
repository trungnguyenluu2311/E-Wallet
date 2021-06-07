import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AddCategory extends StatefulWidget {
  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  Color currentColor = Color(4294198070);
  void changeColor(Color color) => setState(() => currentColor = color);
  final TextEditingController _categorynameInputCtrl = TextEditingController();
  final TextEditingController _noteInputCtrl = TextEditingController();

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

  createCategory() async {
    if(_categorynameInputCtrl.text != ""){
      await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").add({
        "name": _categorynameInputCtrl.text.trim(),
        "note": _noteInputCtrl.text.trim(),
        "color": currentColor.value.toString(),
      });
      Navigator.pop(context);
    }
    else{
      _alterDialogBuilder("Category need a name");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            leading: BackButton(color: Color(0xFFCC0047)),
            backgroundColor: Colors.black,
            centerTitle: true,
            shadowColor: Colors.white,
            title: Text(
              'Add category',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        body: Container(
            padding: EdgeInsets.fromLTRB(0, 24, 0, 24),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 0, 0, 24),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  TextField(
                    controller: _categorynameInputCtrl,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w500),
                        labelText: 'Category name',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.category,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                  Container(
                    color: Color(0xFF1B1C1E),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Select a color',style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 18,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),),
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(color: Color(0xFFCCCCCC))),
                                    content: SingleChildScrollView(
                                      child: BlockPicker(
                                        pickerColor: currentColor,
                                        onColorChanged: changeColor,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.circle,
                              size: 26,
                              color: currentColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                            child: Text(
                              "Choose color",
                              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 18,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextField(
                    controller: _noteInputCtrl,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 18,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w500),
                        labelText: 'Notes',
                        filled: true,
                        fillColor: Color(0xFF1B1C1E),
                        prefixIcon: Icon(
                          Icons.note,
                          size: 26,
                          color: Color(0xFF8D8E90),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                        ),
                      )),
                ],
              ),
            )),
        bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
            decoration: BoxDecoration(
                color: Color(0xFF1B1C1E),
                border:
                    Border(top: BorderSide(color: Colors.white, width: 0.5))),
            child: OutlinedButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Color(0xFFCCCCCC),
                      fontFamily: 'RobotoSlab',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                onPressed: () {createCategory();},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF303030)),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(0, 8, 0, 8)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)))))),
      ),
    );
  }
}

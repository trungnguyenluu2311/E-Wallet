import 'package:e_wallet/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class EditCategory extends StatefulWidget {
  final CategoryModel category;
  EditCategory(this.category);
  @override
  _EditCategoryState createState() => _EditCategoryState(category);
}

class _EditCategoryState extends State<EditCategory> {
  final CategoryModel category;
  _EditCategoryState(this.category);

  Color currentColor;
  void changeColor(Color color) => setState(() => currentColor = color);
  final TextEditingController _categorynameInputCtrl = TextEditingController();
  final TextEditingController _noteInputCtrl = TextEditingController();

  editCategory() async {
    if(_categorynameInputCtrl.text != ""){
      DocumentReference docRef = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(category.id);
      await docRef.update({
        "name": _categorynameInputCtrl.text.trim(),
        "note": _noteInputCtrl.text.trim(),
        "color": currentColor.value.toString(),
      });
      Navigator.pop(context);
      Navigator.pop(context);
    }
    else{
      _alterDialogBuilder("Some field is missing");
    }
  }

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

  @override
  void initState() {
    super.initState();
    currentColor = Color(int.parse(category.color));
    _categorynameInputCtrl.text = category.name;
    _noteInputCtrl.text = category.note;
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
              'Edit category',
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
                  Container(
                    padding: EdgeInsets.all(14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                    child: Column(children: [
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
                          print("$currentColor");
                        },
                        child: Icon(
                          Icons.circle,
                          size: 60,
                          color: currentColor,
                        ),
                      ),
                      Text(
                        "${category.name}",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'RobotoSlab',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      )
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 24, 0, 24),
                    child: Text(
                      'Detail category',
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
                onPressed: () {editCategory();},
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

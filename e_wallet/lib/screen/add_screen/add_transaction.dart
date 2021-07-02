import 'package:e_wallet/models/category_model.dart';
import 'package:e_wallet/screen/select_screen/select_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class AddTransaction extends StatefulWidget {
  final String idwallet;
  final String walletname;
  AddTransaction(this.idwallet,this.walletname);
  @override
  _AddTransactionState createState() => _AddTransactionState(idwallet,walletname);
}

class _AddTransactionState extends State<AddTransaction> {
  dynamic _selectedType = 0;
  final String idwallet;
  final String walletname;
  _AddTransactionState(this.idwallet,this.walletname);

  // final TextEditingController _walletnameInputCtrl = TextEditingController();
  final TextEditingController _transactionnameInputCtrl = TextEditingController();
  final TextEditingController _spendingInputCtrl = TextEditingController();
  final TextEditingController _noteInputCtrl = TextEditingController();
  String idtemptransaction = "nonecategory";
  File _image;

  DateTime selectedDate = DateTime.now();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firestorage = FirebaseStorage.instance;
  final picker = ImagePicker();
  // Color colorTemp = Color(0xFF8D8E90);

  Future pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        // print(_image);
      } else {
        // print('No image selected.');
      }
    });
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
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

  void _choosecategory(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SelectCategory(idtemptransaction)),);
    setState(() {
      idtemptransaction = result;
    });
  }

  createTransaction() async {
  if(_transactionnameInputCtrl.text != "" && _spendingInputCtrl.text != ""){
    if(!_spendingInputCtrl.text.contains(RegExp('[0-9]'))){
      _alterDialogBuilder("Transaction money must be a number");
    }
    else if(_noteInputCtrl.text != "" && _image != null){
      // print("test1");
      Reference ref = _firestorage.ref().child(Path.basename(_image.path));
      UploadTask uploadTask = ref.putFile(_image);
      uploadTask.then((res) {
        res.ref.getDownloadURL().then((fileURL) async {
          await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").add({
          "walletname": walletname,
          "name": _transactionnameInputCtrl.text,
          "spending": _spendingInputCtrl.text,
          "datespend": selectedDate,
          "note": _noteInputCtrl.text,
          "photo": fileURL.toString(),
          "classify": _selectedType.toString(),
          "idcategory": idtemptransaction,
          });
          Navigator.pop(context);
        });
      });
    }
    else{
      if(_noteInputCtrl.text != "" && _image == null){
        // print("test1");
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").add({
          "walletname": walletname,
          "name": _transactionnameInputCtrl.text,
          "spending": _spendingInputCtrl.text,
          "datespend": selectedDate,
          "note": _noteInputCtrl.text,
          "photo": "",
          "classify": _selectedType.toString(),
          "idcategory": idtemptransaction,
        });
        Navigator.pop(context);
      }
      else if(_noteInputCtrl.text == "" && _image != null){
        // print("test2");
        Reference ref = _firestorage.ref().child(Path.basename(_image.path));
        UploadTask uploadTask = ref.putFile(_image);
        uploadTask.then((res) {
          res.ref.getDownloadURL().then((fileURL) async {
            await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").add({
              "walletname": walletname,
              "name": _transactionnameInputCtrl.text,
              "spending": _spendingInputCtrl.text,
              "datespend": selectedDate,
              "note": "",
              "photo": fileURL.toString(),
              "classify": _selectedType.toString(),
              "idcategory": idtemptransaction,
            });
            Navigator.pop(context);
          });
        });
      }
      else{
        // print("test3");
        await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("wallets").doc(idwallet).collection("transactions").add({
          "walletname": walletname,
          "name": _transactionnameInputCtrl.text,
          "spending": _spendingInputCtrl.text,
          "datespend": selectedDate,
          "note": "",
          "photo": "",
          "classify": _selectedType.toString(),
          "idcategory": idtemptransaction,
        });
        Navigator.pop(context);
      }
    }
    }
    else{
      _alterDialogBuilder("Some field is missing");
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
              'Add transaction',
              style: TextStyle(
                  color: Color(0xFFCCCCCC),
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(color: Colors.black),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 6, 40, 6),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B1C1E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: (_selectedType == 0)
                                    ? Color(0xFFF40057)
                                    : Colors.black)),
                        child: Text(
                          'Expense',
                          style: TextStyle(
                              color: (_selectedType == 0)
                                  ? Color(0xFFF40057)
                                  : Color(0xFFE6E6E6),
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedType = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(40, 6, 40, 6),
                        decoration: BoxDecoration(
                            color: Color(0xFF1B1C1E),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(
                                color: (_selectedType == 1)
                                    ? Color(0xFFF40057)
                                    : Colors.black)),
                        child: Text(
                          'Income',
                          style: TextStyle(
                              color: (_selectedType == 1)
                                  ? Color(0xFFF40057)
                                  : Color(0xFFE6E6E6),
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 12,
                  ),
                  TextField(
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
                    controller: _spendingInputCtrl,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 26, 0, 26),
                      filled: true,
                      fillColor: Color(0xFF1B1C1E),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(14)),
                            color: Color(0xFF8D8E90),
                          ),
                          child: Text(
                            'VNĐ',
                            style: TextStyle(
                                fontFamily: 'RobotoSlab',
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                    child: Text(
                      'General',
                      style: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontFamily: 'RobotoSlab',
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 26,
                            color: Color(0xFF8D8E90),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "$walletname",
                              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  TextField(
                    controller: _transactionnameInputCtrl,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      labelStyle: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 20,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700),
                      labelText: 'Name Transaction',
                      filled: true,
                      fillColor: Color(0xFF1B1C1E),
                      prefixIcon: Icon(
                        Icons.help,
                        size: 26,
                        color: Color(0xFF8D8E90),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    )),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              _choosecategory(context);
                            },
                            child: Icon(
                              Icons.category,
                              size: 26,
                              color: Color(0xFF8D8E90),
                            ),
                          ),
                          StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser.uid).collection("categorys").doc(idtemptransaction).snapshots(),
                            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "Choose Category",
                                    style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                  ),
                                );
                                // return Center(child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(child: Text(snapshot.error.toString()));
                              }
                              if(!snapshot.data.exists){
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "Choose Category",
                                    style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                  ),
                                );
                              }else{
                                final category = CategoryModel.fromDocumentSnapshot(documentSnapshot: snapshot.data);
                                // colorTemp = Color(int.parse(category.color));
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: Text(
                                    "${category.name}",
                                    style: TextStyle(color: Color(int.parse(category.color)), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                                  ),
                                );
                              }
                            }
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        color: Color(0xFF1B1C1E)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: (){
                              _selectDate(context);
                            },
                            child: Icon(
                              Icons.date_range,
                              size: 26,
                              color: Color(0xFF8D8E90),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              "Day ${selectedDate.day} Month ${selectedDate.month} Year ${selectedDate.year}",
                              style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(14, 14, 0, 14),
                      child: Text(
                        'More detail',
                        style: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontFamily: 'RobotoSlab',
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                  TextField(
                    controller: _noteInputCtrl,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                        labelStyle: TextStyle(
                            color: Color(0xFFCCCCCC),
                            fontSize: 20,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w700),
                        labelText: 'Note',
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
                  SizedBox(height: 2),
                  GestureDetector(
                    onTap: (){
                      pickImage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          color: Color(0xFF1B1C1E)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 14, 0, 14),
                        child: Row(
                          children: [
                            Icon(
                              Icons.photo,
                              size: 26,
                              color: Color(0xFF8D8E90),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                "Photo",
                                style: TextStyle(color: Color(0xFFCCCCCC), fontSize: 20,fontFamily: 'RobotoSlab', fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: _image == null
                        ? Text("No image selected.")
                        : Image.file(_image),
                  ),
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
                onPressed: () {createTransaction();},
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

import 'package:e_wallet/screen/select_screen/select_currency.dart';
import 'package:flutter/material.dart';

class AddWallet extends StatefulWidget {
  @override
  _AddWalletState createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
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
              'Configure Wallet',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      labelStyle: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 20,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700),
                      labelText: 'Wallet name',
                      filled: true,
                      fillColor: Color(0xFF1B1C1E),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 26,
                        color: Color(0xFF8D8E90),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                      ),
                    )),
                SizedBox(height: 2),
                TextField(
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(0, 14, 0, 14),
                      labelStyle: TextStyle(
                          color: Color(0xFFCCCCCC),
                          fontSize: 20,
                          fontFamily: 'RobotoSlab',
                          fontWeight: FontWeight.w700),
                      labelText: 'Current balance',
                      filled: true,
                      fillColor: Color(0xFF1B1C1E),
                      prefixIcon: Icon(
                        Icons.money,
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
                  padding: EdgeInsets.fromLTRB(14, 14, 14, 14),
                  decoration: BoxDecoration(color: Color(0xFF1B1C1E)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        size: 26,
                        color: Color(0xFF8D8E90),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text('Currency',
                            style: TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 20,
                                fontFamily: 'RobotoSlab',
                                fontWeight: FontWeight.w700)),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectCurrency()));
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              color: Color(0xFF8D8E90), size: 26))
                    ],
                  ),
                )
              ],
            )),
        bottomNavigationBar: Container(
            padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
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
                onPressed: () {},
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

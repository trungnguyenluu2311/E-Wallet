import 'package:e_wallet/services/api_client.dart';
import 'package:e_wallet/services/convert_currencen.dart';
import 'package:e_wallet/widget/contans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ConvertCurrency extends StatefulWidget {
  @override
  _ConvertCurrencyState createState() => _ConvertCurrencyState();
}

class _ConvertCurrencyState extends State<ConvertCurrency> {
  Country fromCountry = datas[0];
  Country toCountry = datas[1];
  double value = 1;
  late Future<double> resFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestConvert();
  }

  _requestConvert() {
    resFuture = ConvertRepo().convert(
      fromCurr: fromCountry.currencey,
      toCurr: toCountry.currencey,
      value: value,
    );
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              leading: BackButton(color: Color(0xFFCC0047)),
              backgroundColor: Colors.black,
              shadowColor: Colors.white,
              title: Text(
                'Convert Currency',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'RobotoSlab',
                    fontSize: 35,
                    fontWeight: FontWeight.w700),
              )),
          body: Container(
              padding: EdgeInsets.fromLTRB(14, 24, 14, 24),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: Colors.black),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      _buildCurrencyView(fromCountry,false),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [BoxShadow(color: Colors.indigo
                                    .withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 3),)
                                ]
                            ),
                            child: Center(
                              child: Text("=", style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600
                              ),),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                final temp = fromCountry;
                                fromCountry=toCountry;
                                toCountry=temp;
                                _requestConvert();
                              });
                            },
                            child: Container(
                              //width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.white)
                              ),
                              child: Row(
                                children: [
                                  Text('Switch Currencies',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  Icon(Icons.compare_arrows_sharp,size: 40,),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30,),
                      FutureBuilder<double>(
                          future: resFuture,
                          builder: (context, snapshot) {
                            if(snapshot.hasData){
                              return _buildCurrencyView(toCountry, true,res:snapshot.data!);
                            }
                            return SizedBox.shrink();
                          }
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }

  Container _buildCurrencyView(Country country,bool isDestination, {double? res}) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
          color: Color(0xff1C1C1C),
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [BoxShadow(
            color: Colors.indigo.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: ()=>_buildMenuCurrency(isDestination),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(country.urlFlag,
                      height: 30,
                      width: 50,),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(country.name,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),),
                        Text(country.currencey,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w400
                          ),)
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            TextFormField(
              key: isDestination ? Key(res.toString()) : Key(value.toString()),
              initialValue: isDestination ? res.toString() : value.toString(),
              onFieldSubmitted: (val){
                if(double.parse(val)!=null){
                  setState(() {
                    value=double.parse(val);
                    _requestConvert();
                  });
                }
              },
              decoration: InputDecoration(
                hintText: '0.0',
                enabled: !isDestination,
                suffixIcon: Text(
                  country.currencey,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                suffixIconConstraints: BoxConstraints(
                    minHeight: 0, minWidth: 0),
              ),
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildMenuCurrency(bool isDestination){
    showCupertinoModalPopup(context: context, builder: (_)=>CupertinoActionSheet(
      actions: _buildListActions(onPressed: (index){
        setState(() {
          isDestination
              ? toCountry = datas[index]
              : fromCountry=datas[index];
          _requestConvert();
          Navigator.pop(context);
        });
      }),
      cancelButton: CupertinoActionSheetAction(child: Text("Cancle"),
        isDestructiveAction: true,
        onPressed: ()=>{
          Navigator.pop(context)
        },),
    ));
  }

  List<Widget> _buildListActions({required Function(int) onPressed}){
    var listAction = List<Widget>.empty(growable: true);
    for(var i=0; i<datas.length;i++)
    {
      listAction.add(CupertinoActionSheetAction(onPressed: ()=>onPressed(i), child: Text(datas[i].name)));
    }
    return listAction;
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:star_vision_admin/widgets/button_widget.dart';
import 'package:star_vision_admin/widgets/form_decoration.dart';

class PayBillPage extends StatefulWidget {

  @override
  _PayBillPageState createState() => _PayBillPageState();
}

class _PayBillPageState extends State<PayBillPage> {
  bool _isLoading=false;
  DateTime? _date;
  List<String> _paymentList=['Cash','Bank'];
  String? _paymentMethod;
  TextEditingController _dueAmount = TextEditingController(text: '1000 TK');
  TextEditingController _paymentAmount = TextEditingController(text: '500 TK');
  TextEditingController _discount = TextEditingController(text: '50');
  TextEditingController _paymentDate = TextEditingController();
  TextEditingController _receiptNo = TextEditingController(text: '1234');
  TextEditingController _status = TextEditingController(text: 'Active');
  TextEditingController _customerInfo = TextEditingController(text: 'ID:101, Name:Ismail Hossain,'
      ' Phone:01830200087, Zone:Sector-12');

  void _pickDate(BuildContext context){
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2050),
    ).then((date)=>
        setState((){
          _date=date!;
          _paymentDate = TextEditingController(text: '${_date!.day}-${_date!.month}-${_date!.year}');
        }));
  }

  @override
  void initState() {
    super.initState();
    _date = DateTime.now();
    _paymentDate = TextEditingController(text: '${_date!.day}-${_date!.month}-${_date!.year}');
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      child: Center(
        child: Container(
          height: size.height*.8,
          width: size.width*.7,
          padding: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: size.height*.2),
                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Customer Info')),
                    SizedBox(width: size.height*.02),
                    Expanded(child: _textBuilder(size, 'Current Status'))
                  ],
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 9),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: Colors.blueGrey, width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            isDense: true,
                            isExpanded: true,
                            value: _paymentMethod,
                            hint: Text('Select Payment Method',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'hindSiliguri',
                                  fontSize: size.height * .022,
                                )),
                            items: _paymentList.map((category) {
                              return DropdownMenuItem(
                                child: Text(
                                  category,
                                  style: TextStyle(
                                      color: Colors.grey.shade900,
                                      fontSize: size.height*.022,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'OpenSans'
                                  ),
                                ),
                                value: category,
                              );
                            }).toList(),
                            onChanged: (newValue) =>
                                setState(() => _paymentMethod = newValue as String?),
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.height*.02),
                    Expanded(child: _textBuilder(size, 'Due Amount')),
                  ],
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Bill Discount')),
                    SizedBox(width: size.height*.02),
                    Expanded(child: _textBuilder(size, 'Payment Amount')),
                  ],
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Money Receipt No')),
                    SizedBox(width: size.height*.02),
                    Expanded(child: _textBuilder(size, 'Payment Date')),
                  ],
                ),
                SizedBox(height: size.height*.04),

                GradientButton(
                    child: Text('Confirm',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans')),
                    onPressed: (){},
                    borderRadius: 5.0,
                    height: 40,
                    width: 250,
                    gradientColors: [
                      Color(0xff162B36),
                      Color(0xff006F64)
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textBuilder(Size size, String hint){
    return TextField(
      controller: hint=='Due Amount'
          ?_dueAmount
          :hint=='Payment Amount'
          ?_paymentAmount
          :hint=='Bill Discount'
          ?_discount
          :hint=='Payment Date'
          ?_paymentDate
          :hint=='Money Receipt No'
          ?_receiptNo
          :hint=='Customer Info'
          ?_customerInfo
          :_status,
      maxLines: hint=='Customer Info'?2:1,
      readOnly: hint=='Due Amount' || hint=='Current Status' ||hint=='Customer Info'||
          hint=='Payment Date'?true:false,
      onTap: (){
        if(hint=='Payment Date'){
          _pickDate(context);
        }
      },
      decoration: formDecoration(size).copyWith(
          labelText: hint
      ),
    );
  }
}

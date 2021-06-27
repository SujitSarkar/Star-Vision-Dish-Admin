import 'package:flutter/material.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:star_vision_admin/widgets/button_widget.dart';
import 'package:star_vision_admin/widgets/form_decoration.dart';
import 'package:provider/provider.dart';

class AddNewCustomer extends StatefulWidget {

  @override
  _AddNewCustomerState createState() => _AddNewCustomerState();
}

class _AddNewCustomerState extends State<AddNewCustomer> {
  bool _isLoading=false;

  TextEditingController _id = TextEditingController(text: '');
  TextEditingController _name = TextEditingController(text: '');
  TextEditingController _address = TextEditingController(text: '');
  TextEditingController _billAmount = TextEditingController(text: '');
  TextEditingController _phone = TextEditingController(text: '');
  TextEditingController _zone = TextEditingController(text: '');
  TextEditingController _discount = TextEditingController(text: '');
  TextEditingController _boxNo = TextEditingController(text: '');
  TextEditingController _boxLocation = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);
    return Container(
      width: publicProvider.pageWidth(size),
      child: Center(
        child: Container(
          height: size.height*.7,
          width: size.width*.7,
          padding: EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///Heading Text
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                  child: Text('Add New Customer by Giving Detailed Information',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height*.02,
                    color: Colors.grey.shade900,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: size.height*.04),

                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'ID')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Name')),
                  ],
                ),
                SizedBox(height: size.height*.04),
                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Address')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Phone Number')),
                  ],
                ),
                SizedBox(height: size.height*.04),
                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Bill Amount')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Discount in TK')),
                  ],
                ),
                SizedBox(height: size.height*.04),
                Row(
                  children: [
                    Expanded(child: _textBuilder(size, 'Zone')),
                    SizedBox(width: size.height*.04),
                    Expanded(child: _textBuilder(size, 'Box Number')),
                  ],
                ),
                SizedBox(height: size.height*.04),
                _textBuilder(size, 'Box Location'),
                SizedBox(height: size.height*.04),

                GradientButton(
                    child: Text('Add Customer',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans')),
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
      controller: hint=='Name'
          ?_name
          : hint=='Address'
          ?_address
          :hint=='Bill Amount'
          ?_billAmount
          : hint=='ID'
          ?_id
          :hint=='Discount in TK'
          ?_discount
          :hint =='Zone'
          ?_zone
          :hint=='Box Number'
          ?_boxNo
          :hint=='Box Location'
          ?_boxLocation
          :_phone,
      decoration: formDecoration(size).copyWith(
        labelText: hint
      ),
    );
  }
}

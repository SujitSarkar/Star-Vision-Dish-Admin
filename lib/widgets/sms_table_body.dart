import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_vision_admin/provider/public_provider.dart';

class SMSTableBody extends StatelessWidget {
  int index;
  SMSTableBody({required this.index});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider = Provider.of<PublicProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tableBodyBuilder(size, index%2==0? 'All':'01830200087', publicProvider),
              _tableBodyBuilder(size, 'Ismail Hossain is a very good man.', publicProvider),
              _tableBodyBuilder(size, '12-05-2021', publicProvider),
            ],
          ),
          SizedBox(height: 5.0),
          Divider(height: 5.0, thickness: 0.5, color: Colors.grey)
        ],
      ),
    );
  }

  Widget _tableBodyBuilder(
      Size size, String tableData, PublicProvider publicProvider) {
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          child:Text(tableData,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: size.height * .021,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'))
      ),
    );
  }
}

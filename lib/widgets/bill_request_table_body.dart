import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:star_vision_admin/provider/public_provider.dart';

class BillRequestTableBody extends StatefulWidget {
  int index;
  BillRequestTableBody({required this.index});
  @override
  _BillRequestTableBodyState createState() => _BillRequestTableBodyState();
}

class _BillRequestTableBodyState extends State<BillRequestTableBody> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PublicProvider publicProvider  = Provider.of<PublicProvider>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _tableBodyBuilder(size, '101', publicProvider),
              _tableBodyBuilder(size, 'Ismail hossain Miah Kashem Miah', publicProvider),
              _tableBodyBuilder(size, '01830200087', publicProvider),
              _tableBodyBuilder(size, 'HDhkashd7612455',publicProvider),
              _tableBodyBuilder(size, 'Jun-2021',publicProvider),
              _tableBodyBuilder(size, 'Jun-2021',publicProvider),
              _tableBodyBuilder(size, '700',publicProvider),
              _tableBodyBuilder(size, '',publicProvider),
            ],
          ),
          SizedBox(height: 5.0),
          Divider(height: 5.0,thickness: 0.5,color: Colors.grey)
        ],
      ),
    );
  }

  Widget _tableBodyBuilder(Size size,String tableData,PublicProvider publicProvider){
    return Expanded(
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(),
          child:tableData.isNotEmpty? Text(
              tableData,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: size.height*.021,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'OpenSans'
              )):ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xff006F64))),
            child: Text('Approve',
                style: TextStyle(
                    fontSize: size.height * .018,
                    fontFamily: 'OpenSans',
                    color: Colors.white)),
            onPressed: () {},
          )

      ),
    );
  }
}

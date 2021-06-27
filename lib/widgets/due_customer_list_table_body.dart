import 'package:flutter/material.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DueCustomerTableBody extends StatelessWidget {
  int index;

  DueCustomerTableBody({required this.index});

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
              _tableBodyBuilder(size, '10', publicProvider),
              _tableBodyBuilder(size, 'Ismail Hossain', publicProvider),
              _tableBodyBuilder(size, 'ECONOMY', publicProvider),
              _tableBodyBuilder(size, '500', publicProvider),
              _tableBodyBuilder(size, '100', publicProvider),
              _tableBodyBuilder(size, '500', publicProvider),
              _tableBodyBuilder(size, '400', publicProvider),
              _tableBodyBuilder(size, '100', publicProvider),
              _tableBodyBuilder(size, '9809', publicProvider),
              _tableBodyBuilder(size, '', publicProvider),
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
        child: tableData.isNotEmpty
            ? Text(tableData,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: size.height * .021,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'OpenSans'))
            : Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff006F64))),
                    child: Text('Pay Bill',
                        style: TextStyle(
                            fontSize: size.height * .018,
                            fontFamily: 'OpenSans',
                            color: Colors.white)),
                    onPressed: () {
                      publicProvider.category= publicProvider.subCategory;
                      publicProvider.subCategory='Pay Bill';
                    },
                  ),
                  SizedBox(width: size.height*.02),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.send, color: Colors.blue),
                    splashRadius: 25,
                  )
                ],
              ),
      ),
    );
  }
}

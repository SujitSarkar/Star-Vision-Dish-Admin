import 'package:flutter/material.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomerProblemTableBody extends StatelessWidget {
  int index;

  CustomerProblemTableBody({required this.index});

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
              _tableBodyBuilder(size, 'Huge Problem here', publicProvider),
              _tableBodyBuilder(size, '01830200087', publicProvider),
              _tableBodyBuilder(size, 'Md. Rahim Miah', publicProvider),
              _tableBodyBuilder(size, 'Uttara, Dhaka', publicProvider),
              _tableBodyBuilder(size, 'Sector-12', publicProvider),
              _tableBodyBuilder(size, '12-06-21', publicProvider),
              _tableBodyBuilder(size, 'pending', publicProvider),
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
        child:tableData == 'pending'
            ?  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('$tableData',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color:tableData == 'pending'?Color(0xffF0A732): Color(0xff006F64),
                          fontSize: size.height * .021,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'OpenSans')),
                  tableData == 'pending'
                      ? ElevatedButton(
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xff006F64))),
                    child: Text('Fix',
                        style: TextStyle(
                            fontSize: size.height * .018,
                            fontFamily: 'OpenSans',
                            color: Colors.white)),
                    onPressed: () {
                      publicProvider.category = publicProvider.subCategory;
                      publicProvider.subCategory = 'solve problem';
                    },
                  ):Container(),
                ],
              )
            :Text('$tableData',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: tableData == 'pending'
                    ? Color(0xffF0A732)
                    : tableData == 'solved'
                    ?Color(0xff006F64)
                    :Colors.grey.shade900,
                fontSize: size.height * .021,
                fontWeight: FontWeight.w400,
                fontStyle:tableData == 'pending' || tableData == 'solved'? FontStyle.italic:FontStyle.normal,
                fontFamily: 'OpenSans')),
      ),
    );
  }
}

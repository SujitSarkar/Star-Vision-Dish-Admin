import 'package:flutter/material.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CustomerListTableBody extends StatelessWidget {
  int index;
  CustomerListTableBody({required this.index});

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
              _tableBodyBuilder(size, 'Dish1$index', publicProvider),
              _tableBodyBuilder(size, 'Ismail Hossain', publicProvider),
              _tableBodyBuilder(size,'01830200087',publicProvider),
              _tableBodyBuilder(size, 'Uttara, Dhaka',publicProvider),
              _tableBodyBuilder(size, 'ECONOMY',publicProvider),
              _tableBodyBuilder(size, '500',publicProvider),
              _tableBodyBuilder(size, 'Active',publicProvider),
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
    return tableData.isNotEmpty
        ? Expanded(
      child: Container(
        alignment: Alignment.center,
        child:Text(
            '$tableData$index',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: tableData=='Active'
                    ?Color(0xff006F64)
                    :tableData=='Inactive'
                    ? Colors.deepOrange
                    : Colors.grey.shade900,
                fontSize: size.height*.021,
                fontWeight: FontWeight.w400,
                fontFamily: 'OpenSans'
            ))
      ),
    ):Container(
      width: size.height*.19,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Color(0xffF0A732))),
            child: Text('update',
                style: TextStyle(fontSize: size.height*.015,fontFamily: 'OpenSans',color: Colors.white)),
            onPressed: (){
              // publicProvider.category= publicProvider.subCategory;
              // publicProvider.subCategory='Pay Bill';
            },
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.delete,color: Colors.redAccent),
            splashRadius: 25,
          ),
          IconButton(
            onPressed: (){},
            icon: Icon(Icons.send,color: Colors.blue),
            splashRadius: 25,
          )
        ],
      ),
    );
  }
}

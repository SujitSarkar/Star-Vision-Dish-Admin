import 'package:flutter/material.dart';
import 'package:star_vision_admin/pages/about_us_page.dart';
import 'package:star_vision_admin/pages/add_bill_man.dart';
import 'package:star_vision_admin/pages/add_new_customer.dart';
import 'package:star_vision_admin/pages/all_customer_list.dart';
import 'package:star_vision_admin/pages/all_sms_page.dart';
import 'package:star_vision_admin/pages/bill_man_list.dart';
import 'package:star_vision_admin/pages/bill_request_page.dart';
import 'package:star_vision_admin/pages/billing_info_page.dart';
import 'package:star_vision_admin/pages/customer_problem_list.dart';
import 'package:star_vision_admin/pages/dashboard_page.dart';
import 'package:star_vision_admin/pages/due_bill_customer_list.dart';
import 'package:star_vision_admin/pages/paid_bill_customer_list.dart';
import 'package:star_vision_admin/pages/pay_bill_page.dart';
import 'package:star_vision_admin/pages/payment_request_list.dart';
import 'package:star_vision_admin/pages/send_sms_page.dart';

class PublicProvider extends ChangeNotifier{
  String _category='';
  String _subCategory='';

  String  get category=>_category;
  String get subCategory=> _subCategory;

  set subCategory(String value){
    _subCategory=value;
    notifyListeners();
  }
  set category(String value){
    _category=value;
    notifyListeners();
  }

  double pageWidth(Size size){
    if(size.width<1300) return size.width;
    else return size.width*.85;
  }

  String pageHeader(){
    if(_category.isNotEmpty && _subCategory.isNotEmpty) return '$_category  \u276D  $_subCategory';
    else if(_category.isEmpty && _subCategory.isNotEmpty) return '$_subCategory';
    else return 'Dashboard';
  }

  Widget pageBody(){
    if(_subCategory=='Add New Customer') return AddNewCustomer();
    else if(_subCategory=='All Customer') return AllCustomerList();
    else if(_subCategory=='Due Bill Customer') return DueBillCustomerList();
    else if(_subCategory=='Paid Bill Customer') return PaidBillCustomerList();
    else if(_subCategory=='Customer Problem List') return CustomerProblemList();
    else if(_subCategory=='Add Bill Man') return AddBillMan();
    else if(_subCategory=='All Bill Man') return BillManList();
    else if(_subCategory=='Payment Request') return PaymentRequestList();
    else if(_subCategory=='Billing Info') return BillingInfoPage();
    else if(_subCategory=='About Us') return AboutUsPage();
    else if(_subCategory=='Send SMS') return SendSMSPage();
    else if(_subCategory=='Show All SMS') return AllSMSPage();
    else if(_subCategory=='Bill Request') return BillRequestPage();
    else if(_subCategory=='Pay Bill') return PayBillPage();
    return DashBoardPage();
  }

  // Future<bool> validateAdmin(BuildContext context, String phone, String password)async{
  //   try{
  //     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Admin')
  //         .where('phone', isEqualTo: phone).get();
  //     final List<QueryDocumentSnapshot> user = snapshot.docs;
  //     if(user.isNotEmpty && user[0].get('password')==password){
  //       return true;
  //     }else{
  //       return false;
  //     }
  //   }catch(error){
  //     showToast(error.toString());
  //     return false;
  //   }
  // }
}
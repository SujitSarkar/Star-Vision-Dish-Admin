import 'package:flutter/material.dart';
import 'package:star_vision_admin/provider/public_provider.dart';
import 'package:star_vision_admin/widgets/button_widget.dart';
import 'package:star_vision_admin/widgets/form_decoration.dart';
import 'package:provider/provider.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _isLoading=false;

  TextEditingController _aboutUs = TextEditingController(text: '');


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
                  child: Text('Write Details Information About Star Vision Dish',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.height*.02,
                      color: Colors.grey.shade900,
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.bold,
                    ),),
                ),
                SizedBox(height: size.height*.08),

                _textBuilder(size, 'AboutStar Vision Dish'),
                SizedBox(height: size.height*.08),

                GradientButton(
                    child: Text('Save',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans')) ,
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
      controller: _aboutUs,
      maxLines: 15,
      decoration: formDecoration(size).copyWith(
          labelText: hint
      ),
    );
  }
}

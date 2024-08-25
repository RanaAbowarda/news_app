import 'package:flutter/material.dart';
import 'package:news_app/api/SourceResponse.dart';
import 'package:news_app/theme/app_color.dart';

class TabItem extends StatelessWidget {
   TabItem({super.key,required this.isSelected,required this.source});
 bool isSelected;
 Source source;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(top: 20),
      padding:const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:isSelected?AppColor.primaryColor:Colors.transparent ,
        border: Border.all(color: AppColor.primaryColor,width: 2),
        borderRadius: BorderRadius.circular(25),

      ),
        child: Text(source.name??"",style: Theme.of(context).textTheme.titleSmall?.copyWith(
    color: isSelected?AppColor.whiteColor:AppColor.primaryColor,
    ),),);
  }
}

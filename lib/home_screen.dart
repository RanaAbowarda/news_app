
import 'package:flutter/material.dart';
import 'package:news_app/api/SourceResponse.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/tab_list/tabs.dart';
import 'package:news_app/theme/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.whiteColor,
        image: DecorationImage(image: AssetImage("assets/images/back_ground.png"),fit: BoxFit.cover)
      ),
      child: Scaffold(
        appBar: AppBar(

          title: Text(""),

        ),
        body: FutureBuilder<SourceResponse?>(future: ApiManager.getSources(), builder: (context,snapshot){
         if (snapshot.connectionState==ConnectionState.waiting){
           return const  Center(child: CircularProgressIndicator(color: AppColor.primaryColor,));
         }else if  ( snapshot.hasError){
         return Column(
           children: [
             Text("Some Thing Went Worng"),
             ElevatedButton(onPressed: (){
               ApiManager.getSources();
             }, child: Text("Try Again")),
           ],
         );

         }
         if(snapshot.data!.status!="ok"){
           return Column(
             children: [
               Text("Some Thing Went Worng"),
               ElevatedButton(onPressed: (){
                 ApiManager.getSources();
               }, child: Text("Try Again")),
             ],
           );
         }
         var source=snapshot.data!.sources;
         return TabWidget(sourceList:source!);
        }),
      ),
    );
  }
}

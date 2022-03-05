import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_cubit.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_states.dart';
import 'package:newsapp/modules/search_screen/search_screen.dart';

class NEWSAPPHOME extends StatelessWidget {
  const NEWSAPPHOME({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NEWSAPPCUBIT,NEWSAPPSTATES>(
       listener: (context , state) {},
       builder: (context , state){
         NEWSAPPCUBIT  cubit = NEWSAPPCUBIT.get(context);
         return Scaffold(
           appBar: AppBar(
             title: Text('News APP'),
             actions: [
               IconButton(
                   onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder:(context)=>SearchScreen()),);
                   },
                   icon: Icon(Icons.search)),

               IconButton(
                   onPressed: (){cubit.changeAppTheme();},
                   icon: Icon(NEWSAPPCUBIT.get(context).brighnessIcon)),
             ],
           ),
           body: cubit.screen[cubit.currentIndex],
           bottomNavigationBar: BottomNavigationBar(
             items: [
               BottomNavigationBarItem(icon: Icon(Icons.business_center) , label: 'Business'),
               BottomNavigationBarItem(icon: Icon(Icons.sports) , label: 'Sports'),
               BottomNavigationBarItem(icon: Icon(Icons.science) , label: 'Science'),
             ],
             currentIndex: cubit.currentIndex,
             onTap: (index) {
               cubit.changeBottomNavBar(index);
             },
           ),

         );
       }

      );
  }
}

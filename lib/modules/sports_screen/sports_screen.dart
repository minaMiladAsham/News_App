import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_cubit.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_states.dart';
import 'package:newsapp/shared/components/components.dart';

class SportsSCreen extends StatelessWidget {
  const SportsSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NEWSAPPCUBIT , NEWSAPPSTATES>(
      listener: (context , state) {},
      builder: (context , state) {
        var list = NEWSAPPCUBIT.get(context).sports;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context , index) => NewsItem(list[index], context),
              separatorBuilder: (context , index) => MyDivider(),
              itemCount: list.length),
          fallback:(context) => Center(child: CircularProgressIndicator()),);
      },
    );
  }
}

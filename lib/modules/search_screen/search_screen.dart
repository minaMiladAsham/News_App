import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_cubit.dart';
import 'package:newsapp/layout/newsapp/cubit/newsapp_states.dart';
import 'package:newsapp/shared/components/components.dart';

class SearchScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NEWSAPPCUBIT, NEWSAPPSTATES>(

        listener: (context , state) {},
        builder : (context , state){

          List list = NEWSAPPCUBIT.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultTextFormField(
                      labelText: 'Search',
                      type: TextInputType.text,
                      prefix: Icons.search,
                      validate: (value) {
                        if (value!.isEmpty){
                          print('search should not be empty');
                        }
                        return null;
                      },
                      onChanged: (searchValue){
                        NEWSAPPCUBIT.get(context).getSearchData(searchValue);
                      }
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context , index) => NewsItem(list[index], context),
                      separatorBuilder: (context , index) => MyDivider(),
                      itemCount: list.length),
                )
              ],
            ),
          );
        }
    );
  }
}

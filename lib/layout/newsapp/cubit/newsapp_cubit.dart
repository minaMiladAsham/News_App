import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business_screen/business_screen.dart';
import 'package:newsapp/modules/science_screen/science_screen.dart';
import 'package:newsapp/modules/sports_screen/sports_screen.dart';
import 'package:newsapp/shared/local/cache_helper.dart';
import 'package:newsapp/shared/networks/remote/dio_helper.dart';
import 'newsapp_states.dart';

class NEWSAPPCUBIT extends Cubit<NEWSAPPSTATES>{
  NEWSAPPCUBIT(): super(NEWSAPPINITIALSTATE());

  static NEWSAPPCUBIT get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = false;
  IconData brighnessIcon = Icons.brightness_4;

  List<Widget> screen = [
    BusinessSCreen(),
    SportsSCreen(),
    ScienceSCreen(),
  ];

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];

  void changeBottomNavBar (index){
    currentIndex = index;
    emit(NEWSAPPChangeBNB());
  }

  void changeAppTheme({bool? fromShared}){
    if (fromShared!=null){
      isDark = fromShared;
      isDark ? brighnessIcon = Icons.brightness_4_outlined : brighnessIcon = Icons.brightness_4;
      emit(NEWSAPPChangeAppTheme());
    }
    else {
      isDark= !isDark ;
      CacheHelper.putBoolean(key: 'brightness', value: isDark).then((value) {
        isDark ? brighnessIcon = Icons.brightness_4_outlined : brighnessIcon = Icons.brightness_4;
        emit(NEWSAPPChangeAppTheme());
      });
    }

  }

  void getBusinessData (){
    emit(NEWSAPPBusinessLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      querry: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '288d43efed4743e8ad2a9b23d017aafb',
      },
    ).then((value) {
      business = value.data['articles'];
      emit(NEWSAPPBusinessSuccess());
    }).catchError((error)
    {
      print("error here ${error.toString()}");
      emit(NEWSAPPBusinessError(error.toString()));
    }
    );
  }

  void getSportsData(){
    emit(NEWSAPPSportsLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        querry: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '288d43efed4743e8ad2a9b23d017aafb',
        }
        ).then((value) {
          sports = value.data['articles'];
          emit(NEWSAPPSportsSuccess());
    }).catchError((error){
      print("error here ${error.toString()}");
      emit(NEWSAPPSportsError(error.toString()));
    }
    );
  }

  void getScienceData(){
    emit(NEWSAPPScienesLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        querry: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '288d43efed4743e8ad2a9b23d017aafb',
        }
    ).then((value) {
      science = value.data['articles'];
      emit(NEWSAPPScienesSuccess());
    }).catchError((error){
      print("error here ${error.toString()}");
      emit(NEWSAPPScienesError(error.toString()));
    }
    );
  }

  void getSearchData(String value){
    emit(NEWSAPPSearchSuccess());
    DioHelper.getData(
        url: 'v2/everything',
        querry: {
          'q' : '$value',
          'apiKey': '288d43efed4743e8ad2a9b23d017aafb',
        }).then((value) {
          search = value.data['articles'];
          emit(NEWSAPPSearchSuccess());
    }).catchError((onError){
      print('error Here ${onError.toString()}');
      emit(NEWSAPPSearchError(onError.toString()));
    });
  }

}
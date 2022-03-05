abstract class NEWSAPPSTATES {}

class NEWSAPPINITIALSTATE extends NEWSAPPSTATES {}

class NEWSAPPChangeBNB extends NEWSAPPSTATES {}

class NEWSAPPChangeAppTheme extends NEWSAPPSTATES {}

class NEWSAPPBusinessSuccess extends NEWSAPPSTATES {}

class NEWSAPPBusinessLoading extends NEWSAPPSTATES {}

class NEWSAPPBusinessError extends NEWSAPPSTATES {
  final String error;
  NEWSAPPBusinessError(this.error);
}

class NEWSAPPSportsSuccess extends NEWSAPPSTATES {}

class NEWSAPPSportsLoading extends NEWSAPPSTATES {}

class NEWSAPPSportsError extends NEWSAPPSTATES {
  final String error;
  NEWSAPPSportsError(this.error);
}

class NEWSAPPScienesSuccess extends NEWSAPPSTATES {}

class NEWSAPPScienesLoading extends NEWSAPPSTATES {}

class NEWSAPPScienesError extends NEWSAPPSTATES {
  final String error;
  NEWSAPPScienesError(this.error);
}

class NEWSAPPSearchSuccess extends NEWSAPPSTATES {}

class NEWSAPPSearchLoading extends NEWSAPPSTATES {}

class NEWSAPPSearchError extends NEWSAPPSTATES {
  final String error;
  NEWSAPPSearchError(this.error);
}
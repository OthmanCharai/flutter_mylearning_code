abstract class NewsState {}

class NewsInitialStates extends NewsState {}

class NewsBottomNavigationChange extends NewsState {}

class NewsGetBusinessDataSuccess extends NewsState {}

class NewsGetBusinessDataError extends NewsState {
  final String error;
  NewsGetBusinessDataError(this.error);
}

class NewsLoadingBusinesstData extends NewsState {}




class NewsGetSportDataSuccess extends NewsState {}

class NewsGetSportDataError extends NewsState {
  final String error;
  NewsGetSportDataError(this.error);
}
class NewsLoadingSportData extends NewsState {}


class NewsGetScienceDataSuccess extends NewsState {}

class NewsGetScienceDataError extends NewsState {
  final String error;
  NewsGetScienceDataError(this.error);
}
class NewsLoadingSciencetData extends NewsState {}


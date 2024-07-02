part of 'historical_cubit.dart';

@immutable
sealed class HistoricalState {}

final class HistoricalInitial extends HistoricalState {}

final class HistoricalPeriodsLoading extends HistoricalState {}

final class HistoricalPeriodsLoaded extends HistoricalState {
  final List historicalList;

  HistoricalPeriodsLoaded(this.historicalList);
}

final class HistoricalPeriodsError extends HistoricalState {
  final String errMessage;

  HistoricalPeriodsError(this.errMessage);
}

final class HistoricalCharacterLoading extends HistoricalState {}

final class HistoricalCharacterLoaded extends HistoricalState {
  final List historicalCharacterList;

  HistoricalCharacterLoaded(this.historicalCharacterList);
}

final class HistoricalCharacterError extends HistoricalState {
  final String errMessage;

  HistoricalCharacterError(this.errMessage);
}

final class HistoricalKingsLoading extends HistoricalState {}

final class HistoricalKingsLoaded extends HistoricalState {
  final List historicalKingsList;

  HistoricalKingsLoaded(this.historicalKingsList);
}

final class HistoricalKingsError extends HistoricalState {
  final String errMessage;

  HistoricalKingsError(this.errMessage);
}

class HistoricalSearchResults extends HistoricalState {
  final List<HistoricalModel> periodsResults;
  final List<HistoricalCharacterModel> charactersResults;
  final List<HistoricalKingsModel> kingsResults;

  HistoricalSearchResults({
    required this.periodsResults,
    required this.charactersResults,
    required this.kingsResults,
  });
}

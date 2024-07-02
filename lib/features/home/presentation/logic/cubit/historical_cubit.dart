import 'package:bloc/bloc.dart';
import 'package:dalel/features/home/data/model/historical_character_model/historical_character_model.dart';
import 'package:dalel/features/home/data/model/historical_kings_model/historical_kings_model.dart';
import 'package:meta/meta.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../data/model/historical_model/historical_model.dart';

part 'historical_state.dart';

class HistoricalCubit extends Cubit<HistoricalState> {
  HistoricalCubit(this.api) : super(HistoricalInitial());
  final ApiConsumer api;

  List<HistoricalModel> historicalPeriods = [];
  List<HistoricalCharacterModel> historicalCharacters = [];
  List<HistoricalKingsModel> historicalKings = [];

  getHistoricalPeriods() async {
    try {
      emit(HistoricalPeriodsLoading());
      final List<dynamic> data =
          await api.get('https://elgaml.atwebpages.com/data_view.php');
      historicalPeriods =
          data.map((item) => HistoricalModel.fromJson(item)).toList();

      emit(HistoricalPeriodsLoaded(historicalPeriods));
    } catch (e) {
      print("Error is $e");
      emit(HistoricalPeriodsError(e.toString()));
    }
  }

  getHistoricalCharacter() async {
    try {
      emit(HistoricalCharacterLoading());
      final List<dynamic> data =
          await api.get('https://elgaml.atwebpages.com/k_api.php');
      historicalCharacters =
          data.map((item) => HistoricalCharacterModel.fromJson(item)).toList();

      emit(HistoricalCharacterLoaded(historicalCharacters));
    } catch (e) {
      print("Error is $e");
      emit(HistoricalCharacterError(e.toString()));
    }
  }

  getHistoricalKings() async {
    try {
      emit(HistoricalKingsLoading());
      final List<dynamic> data =
          await api.get('https://elgaml.atwebpages.com/kings_api.php');
      historicalKings =
          data.map((item) => HistoricalKingsModel.fromJson(item)).toList();
      emit(HistoricalKingsLoaded(historicalKings));
    } catch (e) {
      print("Error is $e");
      emit(HistoricalKingsError(e.toString()));
    }
  }

  void search(String query) {
    final periodsResults = historicalPeriods
        .where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final charactersResults = historicalCharacters
        .where((item) => item.kingName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final kingsResults = historicalKings
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();

    emit(HistoricalSearchResults(
      periodsResults: periodsResults,
      charactersResults: charactersResults,
      kingsResults: kingsResults,
    ));
  }
}

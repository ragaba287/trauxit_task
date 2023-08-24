import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_task/models/latlng_model.dart';
import 'package:trauxit_task/models/weather_model.dart';

import '../../core/services/dio_helper.dart';
import '../../res/res_api_names.dart';
import 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit() : super(WeatherInitState());

  static WeatherCubit get(context) => BlocProvider.of(context);
  final _api = DioHelper.instance;

  Future<void> getLngLat(String city) async {
    emit(GetLngLatLoadingState());

    _api.getData(
      ApiNames.getLngLat,
      query: {
        "appid": "bd5e378503939ddaee76f12ad7a97608",
        "q": city,
      },
    ).then((value) {
      final data = value.data;

      if (value.statusCode == 200) {
        getWeather(LatLngModel.fromJson(data[0]));
        emit(GetLngLatSucccessState());
      } else if (value.statusCode == 400) {
        emit(GetLngLatErrorState());
      } else if (value.statusCode == 442) {
        emit(GetLngLatErrorState());
      } else {
        emit(GetLngLatErrorState());
      }
    }).catchError((e) {
      emit(GetLngLatErrorState());
    });
  }

  WeatherModel? weatherModel;
  Future<void> getWeather(LatLngModel latLngModel) async {
    emit(GetWeatherLoadingState());

    _api.getData(
      ApiNames.currentWeather,
      query: {
        "appid": "bd5e378503939ddaee76f12ad7a97608",
        "lat": latLngModel.lat,
        "lon": latLngModel.lon,
      },
    ).then((value) {
      final data = value.data;

      if (value.statusCode == 200) {
        weatherModel = WeatherModel.fromJson(data);
        emit(GetWeatherSucccessState());
      } else if (value.statusCode == 400) {
        emit(GetWeatherErrorState());
      } else if (value.statusCode == 442) {
        emit(GetWeatherErrorState());
      } else {
        emit(GetWeatherErrorState());
      }
    }).catchError((e) {
      emit(GetWeatherErrorState());
    });
  }
}

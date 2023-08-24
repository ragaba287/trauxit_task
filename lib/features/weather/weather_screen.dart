import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trauxit_task/core/widgets/image_fadder.dart';
import 'package:trauxit_task/core/widgets/main_textbutton.dart';
import 'package:trauxit_task/core/widgets/main_textformfield.dart';
import 'package:trauxit_task/cubit/weather/weather_states.dart';

import '../../cubit/weather/weather_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController teSearch = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<WeatherCubit, WeatherStates>(
        listener: (context, state) {},
        builder: (context, state) {
          WeatherCubit cubit = WeatherCubit.get(context);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get Weather By City Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  'Enter your city name to get the current weather form OpenWeathermap',
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formKey,
                  child: MainTextFormField(
                    teController: teSearch,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'City Name Can\'t be Empty';
                      }
                    },
                    suffixIcon: MainTextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FocusManager.instance.primaryFocus!.unfocus();
                          cubit.getLngLat(teSearch.text);
                        }
                      },
                      title: 'Search',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                if (cubit.weatherModel != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Weather in : ${teSearch.text}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        ImageFadder(
                          height: 150,
                          fit: BoxFit.fitHeight,
                          image:
                              'https://openweathermap.org/img/wn/${cubit.weatherModel?.weather?[0].icon}@4x.png',
                        ),
                        Text(
                          cubit.weatherModel?.weather?[0].description ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cubit.weatherModel?.main?.temp.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(width: 3),
                              const Text(
                                '\u00B0',
                                style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.w800,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Feels like: ${cubit.weatherModel?.main?.feelsLike} \u2103',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        });
  }
}

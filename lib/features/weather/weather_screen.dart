import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return Padding(
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
          BlocConsumer<WeatherCubit, WeatherStates>(
            listener: (context, state) {},
            builder: (context, state) {
              WeatherCubit cubit = WeatherCubit.get(context);

              return Form(
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
              );
            },
          ),
          const SizedBox(height: 10),
          Container(
            child: Column(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

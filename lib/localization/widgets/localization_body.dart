import 'package:cubit_test/localization/cubit/localization_cubit.dart';
import 'package:cubit_test/localization/service/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalizationBody extends StatelessWidget {
  const LocalizationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const locals = ['en', 'ar'];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          title: const Text('Localization body'),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('This Text should be translated'),
                  Text('helloWorld'.tr(context)),
                ],
              ),
              BlocBuilder<LocalizationCubit, LocalizationState>(
                builder: (context, state) {
                  if (state is UpdateLocalization) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: locals
                            .map(
                              (e) => MaterialButton(
                                color: state.local.languageCode == e
                                    ? Colors.green
                                    : Colors.white,
                                textColor: state.local.languageCode == e
                                    ? Colors.white
                                    : Colors.black,
                                onPressed: () {
                                  context.read<LocalizationCubit>().setLocal(e);
                                },
                                child: Text(e.tr(context)),
                              ),
                            )
                            .toList());
                  }
                  return SizedBox();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}

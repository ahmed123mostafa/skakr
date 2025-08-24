import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_app/feature/main/Search/screen/search_screen.dart';

import '../../../../core/constant/custom_text_field.dart';
import '../manager/search_cubit.dart';
import '../manager/search_state.dart';

class SearchFieldWidget extends StatelessWidget {
  bool inSearch;
 SearchFieldWidget({super.key,required this.inSearch});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {

          if (inSearch) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SearchScreen(
                  searchCubit: context.read<SearchCubit>(),
                ),
              ),
            );
          } else {
            print('************************NO NAVIGATOR');
          }
        }
      },


      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: CustomTextFormField(
            controller: context.read<SearchCubit>().searchController,
            onChanged: (String value) {
              final cubit = context.read<SearchCubit>();


              if (cubit.debounce?.isActive ?? false) {
                cubit.debounce?.cancel();
              }

              cubit.debounce = Timer(
                const Duration(milliseconds: 500),
                    () {
                  if (value.isEmpty) {
                    cubit.searchKey(searchKey: '');
                  } else if (value.length >= 3) {
                    cubit.searchKey(searchKey: value);
                  }
                },
              );
            },
            fillColor: Colors.white,
            prefix: const Icon(Icons.search),
            hintText: "type_here_the_one_you_want_to_search_for".tr(),
          ),
        );
      },
    );
  }
}

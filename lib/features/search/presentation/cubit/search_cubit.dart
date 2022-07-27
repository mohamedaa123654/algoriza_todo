import 'package:bloc/bloc.dart';
import 'package:calender_picker/calender_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_algoriza/core/global_var.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);

  List<Map> searchItems = [];

  filterSeach(String query) async {
    searchItems = [];
    if (allTasksToSearch.isNotEmpty) {
      allTasksToSearch.forEach((item) {
        if (item['title'].toLowerCase().contains(query.toLowerCase()) &&
            item['title'].toLowerCase() != '') {
          searchItems.add(item);
        }
      });
      emit(SearchLoadingState());
    }
    emit(SearchGetDataState());
  }
}

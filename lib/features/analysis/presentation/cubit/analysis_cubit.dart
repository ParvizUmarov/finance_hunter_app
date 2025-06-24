import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'analysis_state.dart';

class AnalysisCubit extends Cubit<AnalysisState> {
  AnalysisCubit() : super(AnalysisInitial());



}

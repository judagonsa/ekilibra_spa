import 'package:ekilibra_spa/app/pages/quote/model/quote.dart';
import 'package:ekilibra_spa/app/pages/quote/use_cases.dart/quote_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteUseCases) : super(const QuoteState()) {
    on<LoadServicesEvent>(_loadServices);
    on<CreteQuoteEvent>(_createQuote);
  }

  final QuoteUseCases quoteUseCases;

  void _createQuote(CreteQuoteEvent event, Emitter<QuoteState> emit) {
    if (state.quote?.place == null) {
      emit(QuoteValidateFormState(state, 'Favor escoger un lugar'));
    } else if (state.quote?.serviceId == null) {
      emit(QuoteValidateFormState(state, 'Favor escoger un servicio'));
    } else if (state.quote?.day == null) {
      emit(QuoteValidateFormState(state, 'Favor escoger el día del servicio'));
    } else if (state.quote?.hour == null) {
      emit(QuoteValidateFormState(state, 'Favor escoger la hora del servicio'));
    } else {
      emit(QuoteValidateFormState(state, ''));
      //resp

      // fold
      // emit
    }
  }

  Future _loadServices(
      LoadServicesEvent event, Emitter<QuoteState> emit) async {
    try {
      // emit(LoadingSaveProfile(state.data));

      final resp = await quoteUseCases.loadServicesUseCase.invoke();

      resp.fold(
        (l) => emit(ErrorLoadServicesState(state, 'error cargando servicios')),
        (r) => emit(LoadServicesState(state.copyWith(services: r))),
      );
    } catch (e) {
      emit(ErrorLoadServicesState(state, e.toString()));
    }
  }

  // void _reloadQuote(ReloadQuote event, Emitter<QuoteState> emit) {
  //   emit(ReloadQuoteState(
  //       state.quote.copyWith(
  //         place: null,
  //         serviceId: null,
  //         day: null,
  //         hour: null,
  //         observation: null,
  //       ),
  //       state.services));
  // }
}

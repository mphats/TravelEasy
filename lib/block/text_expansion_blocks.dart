import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_app/block/text_expansion_events.dart';
import 'package:ticket_app/block/text_expansion_states.dart';

class TextExpansionBlocs extends Bloc<TextExpansionEvents, TextExpansionStates>{
  TextExpansionBlocs():super(IsExpandedState(false)){
    on<IsExpandedEvent>((event, emit){
      emit(IsExpandedState(event.isExpanded));
    });
  }

}
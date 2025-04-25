import 'package:flutter_bloc/flutter_bloc.dart';
import 'transaction_event.dart';
import 'transaction_state.dart';
import '../../services/firestore_service.dart';

class TransactionBloc extends Bloc<TransactionEvent, TransactionState> {
  final FirestoreService firestoreService;

  TransactionBloc({required this.firestoreService}) : super(TransactionInitial()) {
    on<LoadTransactions>((event, emit) async {
      emit(TransactionLoading());
      try {
        final transactions = await firestoreService.getTransactions();
        emit(TransactionLoaded(transactions));
      } catch (e) {
        emit(TransactionError('Failed to load transactions'));
      }
    });
  }
}

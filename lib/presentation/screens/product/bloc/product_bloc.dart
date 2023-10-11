import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/product.dart';
import '../../../../domain/errors/app_error.dart';
import '../../../../domain/usecases/fetch_products_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._fetchProductsUseCase) : super(ProductLoadInProgress()) {
    on<ProductEvent>((event, emit) async {
      emit(ProductLoadInProgress());
      final result = await _fetchProductsUseCase();
      emit(result.fold(
        ProductLoadError.new,
        ProductLoadSuccess.new,
      ));
    });
  }

  final FetchProductsUseCase _fetchProductsUseCase;
}

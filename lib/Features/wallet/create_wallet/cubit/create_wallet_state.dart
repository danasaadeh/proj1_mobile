abstract class CreateWalletState {}

class CreateWalletInitial extends CreateWalletState {}

class CreateWalletLoading extends CreateWalletState {}

class CreateWalletFailure extends CreateWalletState {
  final String message;
  CreateWalletFailure({required this.message});
}

class CreateWalletSuccess extends CreateWalletState {
  final String message;

  CreateWalletSuccess({
    required this.message,
  });
}

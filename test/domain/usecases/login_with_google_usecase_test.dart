import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_flow/modules/login/external/drivers/google_sign_in_driver.dart';
import 'package:pay_flow/modules/login/domain/exceptions/login_exception.dart';
import 'package:pay_flow/modules/login/domain/usecases/login_with_google_usecase/login_with_google_usecase.dart';

class GoogleSignInMock extends Mock implements GoogleSignInDriver {}

main() {
  late GoogleSignInMock _googleSignIn;
  late LoginWithGoogleUsecase usecase;

  setUp(() {
    _googleSignIn = GoogleSignInMock();
    usecase = LoginWithGoogleUsecase(_googleSignIn);
  });

  test('Should return a Left LoginException if login returns null', () async {
    //ESTAMOS SIMULANDO O COMPORTAMENTO DO MOCK
    // when(() => _googleSignIn.signIn()).thenAnswer((_) async => null);

    final result = await usecase();

    //VERIFICA O COMPORTAMENTO DO MOCK
    verify(() => _googleSignIn.signIn()).called(1);

    //ESTAMOS TESTANDO SE O RESULTADO DA MINHA CLASSE É O ESPERADO
    expect(result, equals(const Left(LoginException())));
  });
}

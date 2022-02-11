// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:pay_flow/domain/entities/user_entity.dart';
// import 'package:pay_flow/domain/exceptions/hasura_exception.dart';
// import 'package:pay_flow/domain/usecases/save_user_usecase/save_user_usecase.dart';
// import 'package:pay_flow/infra/repositories/user_repository.dart';

// class UserRepositoryMock extends Mock implements UserRepository {}

// void main() {
//   late UserRepositoryMock repository;
//   late SaveUserUsecase usecase;
//   late UserEntity user;

//   setUp(() {
//     repository = UserRepositoryMock();
//     usecase = SaveUserUsecase(repository);
//     user = UserEntity(id: '1', name: 'Ismael', email: 'http.ismaeel@gmail.com');
//   });

//   test('Should return User after saved', () async {
//     when(() => repository.saveUser(user))
//         .thenThrow(() async => const Left(HasuraException()));
//     verify(() => repository.saveUser(user)).called(1);
//     final result = await usecase(user);
//     expect(result, equals(const Left(HasuraException())));
//   });
// }

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_architecture/core/usecase/errors/failures.dart';
import 'package:nasa_clean_architecture/features/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_architecture/features/domain/repositories/space_media_repository.dart';
import 'package:nasa_clean_architecture/features/domain/usecases/get_space_media_from_date_usecase.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_entity_mock.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  test(
    'should get space media entity for a given date from the repository',
    () async {
      // Arrange
      when(() => repository.getSpaceMediaFromDate(any()))
          .thenAnswer((_) async => const Right(tSpaceMedia));

      // Act
      final result = await usecase(tDate);

      // Assert
      expect(result, const Right(tSpaceMedia));
      verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
    },
  );
  
  test('should return a ServerFailure when don\'t succeed', () async {
    // Arrange
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer((_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    // Act
    final result = await usecase(tDate);
    // Assert
    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDate)).called(1);
  });
  
  test('should return a NullParamFailure when receives a null param', () async {
    // Arrange
    // Act
    final result = await usecase(null);
    // Assert
    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getSpaceMediaFromDate(tDate));
  });
}

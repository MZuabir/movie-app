// Mocks generated by Mockito 5.4.4 from annotations
// in movie_app/test/domain_testcases/get_popular_movies_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_app/domain/entities/movie.dart' as _i4;
import 'package:movie_app/domain/repositories/movie_repo.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [MovieRepo].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepo extends _i1.Mock implements _i2.MovieRepo {
  @override
  _i3.Future<List<_i4.Movie>> getTrendingMovies() => (super.noSuchMethod(
        Invocation.method(
          #getTrendingMovies,
          [],
        ),
        returnValue: _i3.Future<List<_i4.Movie>>.value(<_i4.Movie>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.Movie>>.value(<_i4.Movie>[]),
      ) as _i3.Future<List<_i4.Movie>>);

  @override
  dynamic searchMovies(String? query) => super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [query],
        ),
        returnValueForMissingStub: null,
      );
}

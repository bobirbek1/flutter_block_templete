import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_template/core/error/exceptions.dart';
import 'package:flutter_template/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl extends NumberTriviaRemoteDataSource {
  final Dio dioClient;

  NumberTriviaRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async =>
      _getNumberTrivia('http://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async =>
      _getNumberTrivia('http://numbersapi.com/random');

  Future<NumberTriviaModel> _getNumberTrivia(String url) async {
    try {
      final response = await dioClient.get(url);
      return NumberTriviaModel.fromJson(json.decode(response.data));
    } catch (e) {
      if (e is DioError) {
        // ignore: use_rethrow_when_possible
        throw e;
      } else {
        throw ServerUnknownException();
      }
    }
  }
}

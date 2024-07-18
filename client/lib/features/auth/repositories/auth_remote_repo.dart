import 'dart:convert';

import 'package:client/features/auth/model/user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/server_constants.dart';
import '../../../core/failure/failure.dart';

class AuthRemoteRepo {
  /// SIGNUP USER
  /// RETURN STRING IN CASE OF FAILURE AND MAP IN CASE OF SUCCESS
  Future<Either<Failure, UserModel>> signup(
      {required String name, required String email, required String password}) async {
    try {
      // debugPrint("Sending Request For SignUp");

      // Send Post Request
      final response = await http.post(
        Uri.parse("${ServerConstant.serverURL}/auth/signup"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "name": name,
          "email": email,
          "password": password,
        }),
      );

      // Decode JSON to Map
      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      // If Status Code Is Other Than 201 Like 400
      if (response.statusCode != 201) {
        // Return Response Body, Status Code In Case Of Failure
        Left(Failure(response.statusCode.toString()));
        return Left(Failure(decodedResponse['detail']));
      }

      // Return UserModel In Case Of Success
      return Right(UserModel.fromMap(decodedResponse));
    } catch (exception) {
      return Left(Failure(" While Trying To Registering User: ${exception.toString()}"));
    }
  }

  /// LOGIN USER
  Future<Either<Failure, UserModel>> signin({required String email, required String password}) async {
    try {
      // debugPrint("Sending Request For SignIn");

      // Send Post Request
      final response = await http.post(
        Uri.parse("${ServerConstant.serverURL}/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      // Decode JSON to Map
      final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;

      // If Status Code Is Other Than 200
      if (response.statusCode != 200) {
        // Return Response Body, Status Code In Case Of Failure
        Left(Failure(response.statusCode.toString()));
        return Left(Failure(decodedResponse['detail']));
      }

      // Return UserModel In Case Of Success
      return Right(UserModel.fromMap(decodedResponse));
    } catch (exception) {
      return Left(Failure(" While Trying To Login User: ${exception.toString()}"));
    }
  }
}

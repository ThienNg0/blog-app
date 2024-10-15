import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Interface AuthRemoteDataSource
abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

// Triển khai AuthRemoteDataSource với SupabaseClient
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      // Gọi Supabase API để đăng ký
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );

      // Kiểm tra nếu đăng ký không thành công
      if (response.user == null) {
        throw const ServerException('User creation failed. User is null.');
      }

      return response.user!.id;
    } catch (e) {
      // Ném ngoại lệ nếu có lỗi xảy ra
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Gọi Supabase API để đăng nhập
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      // Kiểm tra nếu đăng nhập thành công
      if (response.session != null && response.user != null) {
        return response.user!.id;
      } else {
        // Nếu có lỗi từ API, trả về thông báo chi tiết
        throw const ServerException('Login failed.');
      }
    } catch (e) {
      // Ném ngoại lệ nếu có lỗi trong quá trình đăng nhập
      throw ServerException(e.toString());
    }
  }
}

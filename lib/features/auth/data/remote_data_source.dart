
class RemoteDataSource {
  Future<String> authenticate(String email, String password) async {
    // Simulate API call
    print('Authenticating user: $email');
    return "Authenticated user: $email";
  }
}
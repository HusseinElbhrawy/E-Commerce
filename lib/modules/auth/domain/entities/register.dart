class Register {
  final bool status;
  final String message;
  final RegisterData? data;

  Register({
    required this.status,
    required this.message,
    required this.data,
  });
}

class RegisterData {
  final String name;
  final String email;
  final String phone;
  final int id;
  final String token;
  final String image;

  RegisterData({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.token,
    required this.image,
  });
}

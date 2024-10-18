
class UserModel {

  final String name;
  final String image;
  final String email;
  final String place;
  final String mobile;

  UserModel({
    required this.name, 
    required this.image, 
    required this.email, 
    required this.place, 
    required this.mobile
  });

  factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: '${json['name']['first']} ${json['name']['last']}',
      image: json['picture']['large'] ?? '', 
      email: json['email'] ?? '', 
      place: json['location']['city'] ?? '', 
      mobile: json['phone'] ?? '',
    );
  }
}  
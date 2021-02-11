class User{
  String email;
  String address;
  String number;
  String password;

  User({this.email,this.address,this.number, String username, String password});

  User.fromJson(Map<String ,dynamic> json)
      : email = json['email'],
        address = json['address'],
        number = json['number'];

  Map<String ,dynamic> toJson() =>{
    'email' : email,
    'address' : address,
    'number' : number,
  };
}
class UserModel{
  String? userID, name, email;

  UserModel({this.name, this.email, this.userID});

  // recieve data from server
  factory UserModel.fromMap(map){
    return UserModel(
      userID: map['UserID'],
      name: map['name'],
      email: map['email'],
    );
  }

  //send data to our server
  Map<String, dynamic> toMap(){
    return {
      'UserID' : userID,
      'name' : name,
      'email' : email,

    };
  }

}
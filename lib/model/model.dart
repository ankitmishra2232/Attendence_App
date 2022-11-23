class User{
  String name, teacheremail, phone, password;
  User( this.name,this.teacheremail,this.phone,this.password);
  User.fromJson(Map<String,dynamic> json) :
  // id=json['id'],
        name= json['name'],
        teacheremail=json['teacheremail'],
        phone= json['phone'],
        password= json['password'];

  Map<String,dynamic> toJson()=>{
    'name':name,
    'teacheremail':teacheremail,
    'phone':phone,
    'password':password
  };
}

class LoginUser{
  String teacheremail,password;
  LoginUser(this.teacheremail,this.password);
  LoginUser.fromJson(Map<String,dynamic> json):
      teacheremail=json['teacheremail'],
      password=json['password'];
  Map<String,dynamic> toJson()=>{
    'teacheremail': teacheremail,
    'password':password
  };
}
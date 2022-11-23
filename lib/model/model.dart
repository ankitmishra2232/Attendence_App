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
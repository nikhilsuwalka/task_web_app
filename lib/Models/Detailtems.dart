class DetailItems {
  String fname="";
  String lname="";
  String mobile="";

  DetailItems(String fname, String lname, String mobile){
    this.fname = fname;
    this.lname = lname;
    this.mobile = mobile;
  }

  DetailItems.fromJson(Map<String, dynamic> json) {
    fname = json['Fname'];
    lname = json['Lname'];
    mobile = json['Mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Fname'] = this.fname;
    data['Lname'] = this.lname;
    data['Mobile'] = this.mobile;
    return data;
  }
}

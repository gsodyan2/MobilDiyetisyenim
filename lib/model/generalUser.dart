class GeneralUser {
  late String uid;
  late String email;
  late String fullName;
  late String job;
  late int height;
  late int weight;
  late bool isNutritionist;
  late String city;

  GeneralUser();

  GeneralUser.withData(this.uid, this.email, this.fullName, this.job,
      this.height, this.weight, this.isNutritionist, this.city);
}

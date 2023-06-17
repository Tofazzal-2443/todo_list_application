class OnBoardingModel{
  String image;
  String title;
  String? subTitle;

  OnBoardingModel({required this.image, required this.title, this.subTitle});
}

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    image: "assets/images/secure.png",
    title: "SECURE",
    subTitle: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  ),
  OnBoardingModel(
    image: "assets/images/planning.png",
    title: "PLANNING",
    subTitle: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  ),
  OnBoardingModel(
    image: "assets/images/dalywork.png",
    title: "DALY WORK",
    subTitle: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
  ),
];
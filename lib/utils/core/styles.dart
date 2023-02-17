import '../links.dart';

const kBodyWhiteStyle16 = TextStyle(color: Colors.white, fontSize: 16.0);

InputDecoration returnTextDecoration(
    {required String title,
    required Icon icon,
    Icon? icon2,
    Function? function}) {
  InputDecoration kBodyBlackTextFormStyle;

  if (icon2 != null) {
    kBodyBlackTextFormStyle = InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        prefixIcon: icon,
        suffixIcon: IconButton(
          icon: icon2,
          onPressed: () => function!(),
        ));
  } else {
    kBodyBlackTextFormStyle = InputDecoration(
      labelText: title,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      prefixIcon: icon,
    );
  }
  return kBodyBlackTextFormStyle;
}

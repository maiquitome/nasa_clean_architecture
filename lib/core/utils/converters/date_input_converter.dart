// class DateToStringConverter {
//   static String convert(DateTime date) {
//     var dateSplitted = date.toString().split(' ');
//     return dateSplitted.first;
//   }
// }

class DateInputConverter {
  static String format(DateTime date) {
    var dateSplited = date.toString().split(' ');
    return dateSplited.first;
  }
}

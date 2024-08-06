//return todays date formatted as yyymmdd

String todaysDateFormatted() {
  //today
  var dateTimeObject = DateTime.now();

  // year in the format yyyy
  String year = dateTimeObject.year.toString();

//month in the format mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = '0$month';
  }

  // day in the format dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = '0$day';
  }

  // final format
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// Convert String yyyymmdd to DateTime Object
DateTime convertStringToDate(String yyyymmdd) {
  // year
  int yyyy = int.parse(yyyymmdd.substring(0, 4));

  // month
  int mm = int.parse(yyyymmdd.substring(4, 6));

  // day
  int dd = int.parse(yyyymmdd.substring(6, 8));

  // create DateTime object
  DateTime dateTimeObject = DateTime(yyyy, mm, dd);

  return dateTimeObject;
}

//

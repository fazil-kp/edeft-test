enum ButtonType {
  primary,
  secondary,
  positive,
  negative,
  warning, additional,
}

enum StatusScreenStatus {
  success,
  failed,
  thanks,
  welcome,
}

enum FoodTime{
  breakfast,
  lunch,
  dinner
}
extension FoodTimeExtension on FoodTime {
  String get value {
    switch (this) {
      case FoodTime.breakfast:
        return 'Breakfast';
      case FoodTime.lunch:
        return 'Lunch';
      case FoodTime.dinner:
        return 'Dinner';
    }
  }
}

enum TempTimeEnum {
  nineam,tenam,elevenam,twelvepm, onepm, twopm, threepm, fourpm, fivepm, sixpm, sevenpm, eightpm, ninepm, tenpm
}
extension TempTimeEnumExtension on TempTimeEnum {
  String get value {
    switch (this) {
      case TempTimeEnum.nineam:
        return '9:00 AM';
      case TempTimeEnum.tenam:
        return '10:00 AM';
      case TempTimeEnum.elevenam:
        return '11:00 AM';
      case TempTimeEnum.twelvepm:
        return '12:00 PM';
      case TempTimeEnum.onepm:
        return '1:00 PM';
      case TempTimeEnum.twopm:
        return '2:00 PM';
      case TempTimeEnum.threepm:  
        return '3:00 PM';
      case TempTimeEnum.fourpm:
        return '4:00 PM';
      case TempTimeEnum.fivepm:
        return '5:00 PM';
      case TempTimeEnum.sixpm:
        return '6:00 PM';
      case TempTimeEnum.sevenpm:
        return '7:00 PM';
      case TempTimeEnum.eightpm:
        return '8:00 PM';
      case TempTimeEnum.ninepm:
        return '9:00 PM';
      case TempTimeEnum.tenpm:
        return '10:00 PM';
        
    }
  }
}
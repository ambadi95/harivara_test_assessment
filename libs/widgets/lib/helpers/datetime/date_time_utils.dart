bool isLeapYear(int year) {
  if ((year % 4 == 0 && year % 400 == 0) ||
      (year % 4 == 0 && !(year % 100 == 0))) {
    return true;
  } else {
    return false;
  }
}

int getDaysOfMonth(int index) {
  if (index < 8) {
    return index.isOdd ? 31 : 30;
  } else {
    return index.isOdd ? 30 : 31;
  }
}

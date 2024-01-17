class Formatter {
  static populationFormatter(num populatioin) {
    if (populatioin > 999 && populatioin < 99999) {
      return "${(populatioin / 1000).toStringAsFixed(1)} K";
    } else if (populatioin > 99999 && populatioin < 999999) {
      return "${(populatioin / 1000).toStringAsFixed(0)} K";
    } else if (populatioin > 999999 && populatioin < 999999999) {
      return "${(populatioin / 1000000).toStringAsFixed(1)} M";
    } else if (populatioin > 999999999) {
      return "${(populatioin / 1000000000).toStringAsFixed(1)} B";
    } else {
      return populatioin.toString();
    }
  }
}

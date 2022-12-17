import 'package:intl/intl.dart';

String numberMaskPrice(dynamic price){
  try{
    NumberFormat numberFormat = NumberFormat('#,###','ru');
    return numberFormat.format(price);
  }catch(error){}
  return "";
}
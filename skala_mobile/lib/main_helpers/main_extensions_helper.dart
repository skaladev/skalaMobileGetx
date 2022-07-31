
import 'package:intl/intl.dart';

extension dateFormat on DateTime {
  
  String ddMMyyyy([String? delimiter = "-"])=>
    DateFormat('dd${delimiter}MM${delimiter}yyyy').format(toLocal());


  String ddMMMMyyyy([String? delimiter = "-"])=>
    DateFormat('dd${delimiter}MMMM${delimiter}yyyy').format(toLocal());
  

  String ddMMMMyyyyHHmm([String? delimiter = "-"])=>
    DateFormat('dd${delimiter}MMMM${delimiter}yyyy HH:mm').format(toLocal());
}
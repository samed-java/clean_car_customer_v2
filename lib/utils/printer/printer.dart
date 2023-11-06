import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class Printer{
  Logger logger = Logger(printer: PrettyPrinter(
      printTime: false,
      methodCount: 1
    ));


  void log(String e){

  }

  void print(String e){

  }

  void error(Exception e){

  }

  void errorWithStackTrace(Exception e, StackTrace s){

  }

  void printResponse(Response response){

  }

}
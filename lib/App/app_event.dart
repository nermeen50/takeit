import 'package:syncfusion_flutter_datepicker/datepicker.dart';

abstract class AppEvent {}

class Click extends AppEvent {}

class Filter extends AppEvent {
  int data;

  Filter({this.data});
}

class BookingTime extends AppEvent {
  int data;
  String newval;

  BookingTime({this.data, this.newval});
}

class ActivateCode extends AppEvent {}

class Increment extends AppEvent {}

class Decrement extends AppEvent {}

class SelectedDate extends AppEvent {
  DateRangePickerSelectionChangedArgs args;
  SelectedDate({this.args});
}

class Edit extends AppEvent {}

class Details extends AppEvent {
  int id;
  Details({this.id});
}

class Booking extends AppEvent {
  int branchId;
  Booking({this.branchId});
}

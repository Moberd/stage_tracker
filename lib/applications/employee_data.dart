class EmployeeData
{
  Status _status;
  String _header;
  String _description;
  DateTime _timePassed;

  Status get status => _status;

  set status(Status value) {
    _status = value;
  }

  EmployeeData(Status s, String header, String  description,DateTime timeCreated)
  {
    _status = s;
    _header=header;
    _description=description;
    //TODO Сделать обработку времени
    _timePassed = DateTime.now();
  }

  String get header => _header;

  set header(String value) {
    _header = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  DateTime get timePassed => _timePassed;

  set timePassed(DateTime value) {
    _timePassed = value;
  }
}
enum Status{
  assepted, waiting, denied
}
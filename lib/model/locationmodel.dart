import 'package:rentina/services/conv/sortedCar.dart';
import 'package:scoped_model/scoped_model.dart';

class LocationModel extends Model{
  List<dynamic> carList = List<dynamic>();

  addCarList(Car car){
    carList.add(car);
    notifyListeners();
  }
  setCarList(List<dynamic> carList){
    this.carList = carList;
    notifyListeners();
  }
}
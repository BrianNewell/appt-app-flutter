import 'package:appt_app/models/services_model.dart';
import 'package:appt_app/models/staff_model.dart';
import 'package:appt_app/repository/services_repository.dart';
import 'package:appt_app/repository/staff_repository.dart';
import 'package:flutter/foundation.dart' as foundation;

class AppStateModel extends foundation.ChangeNotifier {
  ////////// CART //////////

  final _servicesInCart = <int, int>{};

  /// Return Map of Service Ids and Quantity from the cart
  Map<int, int> get servicesInCart {
    return Map.from(_servicesInCart);
  }

  /// Add Service to Cart
  void addServiceToCart(int serviceId) {
    if (!_servicesInCart.containsKey(serviceId)) {
      // Service not already in the cart - add to cart, set quantity to one
      _servicesInCart[serviceId] = 1;
    } else {
      // Service already in the cart - increment quantity
      _servicesInCart[serviceId]++;
    }
    notifyListeners();
  }

  /// Remove Service from Cart
  void removeServiceFromCart(int serviceId) {
    if (_servicesInCart.containsKey(serviceId)) {
      // Make sure it is in the cart first
      if (_servicesInCart[serviceId] == 1) {
        // Quantity is one - remove from the cart
        _servicesInCart.remove(serviceId);
      } else {
        // Quanity more than one - decrement quantity
        _servicesInCart[serviceId]--;
      }
    }
    notifyListeners();
  }

  /// Total time for all Services in the Cart
  int get totalServiceTime {
    if (_servicesInCart.length == 0) {
      return 0;
    }
    int totalMinutes = 0;
    for (int index = 0; index < _servicesInCart.length; index++) {
      dynamic serviceId = _servicesInCart.keys.toList()[index];
      dynamic serviceMinutes = _availableServices[serviceId - 1].serviceMinutes;
      dynamic serviceQuantity = _servicesInCart.values.toList()[index];
      totalMinutes = totalMinutes + (serviceMinutes * serviceQuantity);
    }
    return totalMinutes;
  }

  /// Clear the cart
  void clearCart() {
    _servicesInCart.clear();
    notifyListeners();
  }

  ////////// SERVICES //////////

  List<Service> _availableServices;

  /// Return List of loaded Services
  List<Service> getServices() {
    if (_availableServices == null) {
      return [];
    }
    return List.from(_availableServices);
  }

  /// Load Services data from repository
  void loadServices() {
    _availableServices = ServicesRepository.loadServices();
    notifyListeners();
  }

  /// Return Service instance matching service id
  Service getServiceById(int id) {
    return _availableServices.firstWhere((service) => service.id == id);
  }

  ////////// STAFF //////////

  List<Staff> _availableStaff;

  /// Return List of loaded Staff
  List<Staff> getStaff() {
    if (_availableStaff == null) {
      return [];
    }
    return List.from(_availableStaff);
  }

  /// Load Staff data from repository
  void loadStaff() {
    _availableStaff = StaffRepository.loadStaff();
    notifyListeners();
  }

  int apptPreferredStaffInCart;

  /// Update Cart Item -- Preferred Staff for Appointment
  void setApptPreferredStaff(int id) {
    apptPreferredStaffInCart = id;
    notifyListeners();
  }

  int apptSelectedStaffInCart;

  void setApptSelectedStaff(int id) {
    apptSelectedStaffInCart = id;
    notifyListeners();
  }

  ////////// APPOINTMENT DATE TIME //////////

  DateTime apptPreferredDateInCart;

  /// Update Cart Item -- Appointment Date
  void setApptPreferredDate(DateTime dt) {
    apptPreferredDateInCart = dt;
    notifyListeners();
  }

  DateTime apptPreferredTimeInCart;

  /// Update Cart Item -- Appointment Time
  void setApptPreferredTime(DateTime dt) {
    apptPreferredTimeInCart = dt;
    notifyListeners();
  }

  // Update Cart Item -- Appointment Date and Time
  DateTime get apptDateTimeInCart {
    if (apptPreferredDateInCart == null || apptPreferredTimeInCart == null)
      return null;
    return DateTime(
        apptPreferredDateInCart.year,
        apptPreferredDateInCart.month,
        apptPreferredDateInCart.day,
        apptPreferredTimeInCart.hour,
        apptPreferredTimeInCart.minute,
        apptPreferredTimeInCart.second);
  }

  ////////// UTILITY //////////

  /// Load all application datasets
  void loadAppData() {
    loadServices();
    loadStaff();
  }
}

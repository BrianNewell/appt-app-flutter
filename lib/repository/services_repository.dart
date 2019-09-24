import 'package:appt_app/models/services_model.dart';

class ServicesRepository {
  static const _allServices = <Service>[
    Service(
      id: 1,
      description: 'Professional Haircut \n"The Usual"',
      price: '28',
      serviceMinutes: 30,
    ),
    Service(
      id: 2,
      description: 'Head Shave \n"The No Comb Dome"',
      price: '22',
      serviceMinutes: 20,
    ),
    Service(
      id: 3,
      description: 'Straight Razor Shave \n"The Edge"',
      price: '28',
      serviceMinutes: 20,
    ),
    Service(
      id: 4,
      description:
          'Prefessional Haircut for Seniors 65 and older, or 12 and Under',
      price: '25',
      serviceMinutes: 30,
    ),
    Service(
      id: 5,
      description: 'Buzz Cut \n"The High-and-Tight"',
      price: '17',
      serviceMinutes: 30,
    ),
    Service(
      id: 6,
      description: 'Shampoo and Conditioning \n"The Fresh Start"',
      price: '40',
      serviceMinutes: 45,
    ),
  ];

  static List<Service> loadServices() {
    return _allServices;
  }
}

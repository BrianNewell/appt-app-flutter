import 'package:appt_app/models/staff_model.dart';

class StaffRepository {
  static const _allStaff = <Staff>[
    Staff(
      id: 1,
      name: 'Anthony Estrongeman',
      bio:
          'Anthony Estrongeman founded Best Barbers & Salon in 2008. After years of honing his craft around an array of seasoned barbers, "Tony" decided it was time to pursue his dream  of opening the greatest barber shop ever.  A native Californian, he now lives in Winterfell with his wife Samantha and two fur babies.',
      imageAsset: 'assets/images/barber-1.jpg',
      availableTimes: [
        '1970-01-01 09:00:00',
        '1970-01-01 10:00:00',
        '1970-01-01 14:00:00',
        '1970-01-01 16:00:00'
      ],
    ),
    Staff(
      id: 2,
      name: 'Lisa Sum',
      bio:
          'Lisa Sum is a fifth generation, native Minoan, and former Coastguard Lieutenant who began cutting hair in high school, sharpening her craft at an early age. While serving, she cut fellow servicemen and 19 years later officially started barber school in Naboo. In school, she learned to cut all types of hair, refined her skills with a straight razor and developed her personal motto; “If you can grow it, I can cut it."',
      imageAsset: 'assets/images/barber-2.jpg',
      availableTimes: [
        '1970-01-01 08:00:00',
        '1970-01-01 11:00:00',
        '1970-01-01 13:00:00',
        '1970-01-01 18:00:00'
      ],
    ),
    Staff(
      id: 3,
      name: 'Jennifer "Jenny" O\'Reilly ',
      bio:
          'Jennifer "Jenny" O\'Reilly hails from East Westworld. She proudly promotes a cut-and-run style that will really sharpen your look. Jenny works mainly evenings and any holiday that highlights peace, love and enrichment. Come see Jen!!!',
      imageAsset: 'assets/images/barber-3.jpg',
      availableTimes: [
        '1970-01-01 16:00:00',
        '1970-01-01 17:00:00',
        '1970-01-01 19:00:00',
        '1970-01-01 20:00:00'
      ],
    )
  ];

  static List<Staff> loadStaff() {
    return _allStaff;
  }
}

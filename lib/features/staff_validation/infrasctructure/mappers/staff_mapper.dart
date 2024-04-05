import '../../domain/domain.dart';

class StaffMapper {
  static Staff staffJsonToEntity(Map<String, dynamic> json) => Staff(
        id: json["id"] ?? '0',
        name: json["name"] ?? 'None',
        position: json["position"] ?? 'None',
        location: json["location"] ?? 'None',
      );
}

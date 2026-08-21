enum PackageStatus {
  processing,
  inTransit,
  outForDelivery,
  delivered,
}

class PackageItem {
  final String id;
  final String trackingNumber;
  final String title;
  final String sender;
  final String receiver;
  final String origin;
  final String destination;
  final String estimatedDate;
  final String estimatedTime;
  final PackageStatus status;
  final double progress;
  final String weight;

  const PackageItem({
    required this.id,
    required this.trackingNumber,
    required this.title,
    required this.sender,
    required this.receiver,
    required this.origin,
    required this.destination,
    required this.estimatedDate,
    required this.estimatedTime,
    required this.status,
    required this.progress,
    required this.weight,
  });
}
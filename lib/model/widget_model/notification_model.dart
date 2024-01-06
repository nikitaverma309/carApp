class NotificationModel {
  final String message;
  final String subtitle;
  final DateTime createdAt;

  NotificationModel(
      {required this.message, required this.subtitle, required this.createdAt});
}

List<NotificationModel> notifications = [
  NotificationModel(
    message: 'Your car rental reservation has been confirmed.',
    subtitle: 'Confirmation',
    createdAt: DateTime.now().subtract(Duration(days: 2)),
  ),
  NotificationModel(
    message: 'Your rented car is due for return tomorrow.',
    subtitle: 'Reminder',
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
  NotificationModel(
    message: 'Special discount available for your next booking!',
    subtitle: 'Offer',
    createdAt: DateTime.now().subtract(Duration(hours: 12)),
  ),
  NotificationModel(
    message: 'Your payment for the rental has been received.',
    subtitle: 'Payment Confirmation',
    createdAt: DateTime.now().subtract(Duration(days: 5)),
  ),
  NotificationModel(
    message: 'New cars added to our fleet. Check them out now!',
    subtitle: 'New Additions',
    createdAt: DateTime.now().subtract(Duration(days: 3)),
  ),
  NotificationModel(
    message: 'Your car rental has been extended successfully.',
    subtitle: 'Extension',
    createdAt: DateTime.now().subtract(Duration(days: 1, hours: 6)),
  ),
  NotificationModel(
    message: 'We appreciate your feedback on your recent rental experience.',
    subtitle: 'Feedback Request',
    createdAt: DateTime.now().subtract(Duration(days: 4)),
  ),
  NotificationModel(
    message: 'Upcoming maintenance may affect car availability.',
    subtitle: 'Maintenance Notice',
    createdAt: DateTime.now().subtract(Duration(days: 6)),
  ),
  NotificationModel(
    message: 'Congratulations! You are eligible for a loyalty reward.',
    subtitle: 'Loyalty Reward',
    createdAt: DateTime.now().subtract(Duration(days: 2, hours: 3)),
  ),
  NotificationModel(
    message: 'Your car rental has been canceled successfully.',
    subtitle: 'Cancellation',
    createdAt: DateTime.now().subtract(Duration(days: 1)),
  ),
];

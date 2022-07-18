abstract class IInactivityService {
  /// To be called when the application moves to the background
  Future<void> movedToBackground();

  /// To be called when the application resumes from the background
  Future<void> movedToForeground();

  /// Called to stop the inactivity timer which will prevent the timer triggering.
  void stopTimer();

  /// Called to start the inactivty timer.
  void startTimer();

  /// Called to register an interaction event
  void registerInteraction(dynamic event);
}

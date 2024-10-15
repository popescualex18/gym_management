abstract class BaseState {
  const BaseState();
}

class BusyState extends BaseState {
  const BusyState();
}

class ActionState extends BaseState {
  const ActionState();
}

class ErrorState extends BaseState {
  final String message;
  const ErrorState(this.message);
}

class DataState<T> extends BaseState {
  final T data;
  const DataState(this.data);
}

class EmptyState extends BaseState {
  const EmptyState();
}

class Void {

}

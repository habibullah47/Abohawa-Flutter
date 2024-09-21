void main() {
  allTaskCompleted();
}

//Using async here for completing result
void allTaskCompleted() async {
  task1();
  String taskTwoResult = await task2();
  task3(taskTwoResult);
}

void task1() {
  print('Task 1 completed');
}

///[Future] as return type for async function. Example as coffee receipt.
Future<String> task2() async {
  Duration duration = Duration(seconds: 3);

  String result = '';

  await Future.delayed(duration, () {
    result = 'Task 2 data';
    print('Task 2 completed');
  });
  return result;
}

void task3(String taskTwoData) {
  print('Task 3 completed with $taskTwoData');
}

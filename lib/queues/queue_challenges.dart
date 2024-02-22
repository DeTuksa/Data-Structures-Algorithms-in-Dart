import 'package:dsa_dart/queues/queue.dart';

testBasicOps() {
  final queue = QueueRingBuffer<String>(10);
  queue.enqueue('Ray');
  queue.enqueue('Brian');
  queue.enqueue('Eric');
  print(queue);

  queue.dequeue();
  print(queue);

  queue.peek;
  print(queue);
}

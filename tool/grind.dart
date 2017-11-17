import 'dart:io';
import 'package:grinder/grinder.dart';
import 'benchmark.dart' as benchmarkHelper;


main(args) => grind(args);

@Task()
Future test() => new TestRunner().testAsync();

@Task()
Future benchmark() => benchmarkHelper.runBenchmarks();

@Task()
Future doc() async {
  // ProcessResult results = await Process.run('dartdoc', []);
  // log(results.stdout);
  await benchmarkHelper.documentBenchmarks();
}

@DefaultTask()
@Depends(test)
void build() {
  Pub.build();
}

@Task()
void clean() => defaultClean();
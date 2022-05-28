import 'package:find_next_file_name/find_next_file_name.dart';

void main() {
  print(findNextFileName('test/example-test-files', filename: 'test.html'));
  // prints:  'test (1).html'

  // or you can pass is as one dir
  print(findNextFileName('test/example-test-files/test.html'));
  // prints:  'test (1).html'

  print(findNextFileName('test/example-test-files', filename: 'test.html', continueCounting: true));
  // prints:  'test (1).html'

  // in case when `myfile.doc` and 'myfile (1).doc' exist
  print(findNextFileName('test/example-test-files', filename: 'myfile.doc', continueCounting: true));
  // prints:  'myfile (2).doc'

  print(findNextFileName('test/example-test-files', filename: 'myfile (1).doc')); 
  // or
  print(findNextFileName('test/example-test-files', filename: 'myfile (1).doc', continueCounting: false));
  // or
  print(findNextFileName('test/example-test-files/myfile (1).doc', continueCounting: false));
  // prints:  'myfile (1) (1).doc'

  print(findNextFileName('test/example-test-files', filename: 'myfile (1).doc', continueCounting: true));
  // prints:  'myfile (2).doc'

  print(findNextFileName('test/example-test-files', filename: 'myfile (2).doc', continueCounting: true));
  // prints:  'myfile (2).doc'

  print(findNextFileName('test/example-test-files', filename: 'myfile (2).doc'));
  // prints:  'myfile (2).doc'
}

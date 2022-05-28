import 'package:find_next_file_name/find_next_file_name.dart';
import 'package:test/test.dart';

void main() {
  group('tests on files inside this project', () {
    test('for existing returns name with 1 in brackets', () {
      expect(findNextFileName("README.md"), equals("README (1).md"));
    });
    test('for existing returns name with 1 in brackets', () {
      expect(findNextFileName("README.md"), equals("README (1).md"));
    });

    test('for not existing returns the same name', () {
      expect(findNextFileName("main.dart"), equals("main.dart"));
    });

    test('for not existing with number in brackets returns the same name', () {
      expect(findNextFileName("./README (1).md"), equals("README (1).md"));
    });

    test('for not existing file in some directory returns the same name', () {
      expect(findNextFileName("test/example-test-files/whoami.js"),
          equals("whoami.js"));
    });

    test(
        'for existing file in some directory returns name with number in brackets',
        () {
      expect(findNextFileName("test/example-test-files/mytests.js"),
          equals("mytests (1).js"));
    });

    test('for "./example-test-filesREADME (1).md" return "README (1).md"', () {
      expect(findNextFileName("./example-test-files/index (1).html"),
          equals("index (1).html"));
    });

    test(
        'for existing file with number in brackets returns name with the old number part unchanged and new number in brackets',
        () {
      expect(findNextFileName("test/example-test-files/myfile (1).doc"),
          equals("myfile (1) (1).doc"));
    });
    test(
        'for existing file with number in brackets and "continueCounting = false" returns name with the old number part unchanged and new number in brackets',
        () {
      expect(
          findNextFileName("test/example-test-files/myfile (1).doc",
              continueCounting: false),
          equals("myfile (1) (1).doc"));
    });

    test(
        'for existing file with number in brackets and "continueCounting = true" returns name with next number in brackets relative to the existing one',
        () {
      expect(
          findNextFileName("test/example-test-files/myfile (1).doc",
              continueCounting: true),
          equals("myfile (2).doc"));
    });

    test(
        'for NOT existing file and "continueCounting = false" returns the name with number in brackets',
        () {
      expect(
          findNextFileName("test/example-test-files/whoami.js",
              continueCounting: false),
          equals("whoami.js"));
    });
    test(
        'for NOT existing file and "continueCounting = true" returns the name with number in brackets',
        () {
      expect(
          findNextFileName("test/example-test-files/whoami.js",
              continueCounting: true),
          equals("whoami.js"));
    });

    test(
        'for NOT existing file with number in brackets and "continueCounting = true" returns the same name',
        () {
      expect(
          findNextFileName("test/example-test-files/myfile (2).doc",
              continueCounting: true),
          equals("myfile (2).doc"));
    });

    test(
        'for existing file and "continueCounting = true" returns the name with number in brackets',
        () {
      expect(
          findNextFileName("test/example-test-files/test.html",
              continueCounting: true),
          equals("test (1).html"));
    });

    test('for invalid file name should throw an argument error', () {
      Object? error;
      try {
        var a = findNextFileName("test/example-test-files/");
      } catch (err) {
        error = err;
      }

      expect(
        error,
        isA<ArgumentError>().having(
            (error) => error.message, 'message', filenameArgumentErrorMsg),
      );

// following doesn't work :(
      // expect(
      //   findNextFileName("test/example-test-files/", filename: ''),
      //   throwsA(
      //     isA<ArgumentError>().having(
      //         (error) => error.message, 'message', filenameArgumentErrorMsg),
      //   ),
      // );
    });

    group('tests on files inside this project using filename argument', () {
      test('for existing returns name with 1 in brackets', () {
        expect(findNextFileName("", filename: "README.md"),
            equals("README (1).md"));
      });
      test('for existing returns name with 1 in brackets', () {
        expect(findNextFileName("", filename: "README.md"),
            equals("README (1).md"));
      });

      test('for not existing returns the same name', () {
        expect(
            findNextFileName("", filename: "main.dart"), equals("main.dart"));
      });

      test('for not existing with number in brackets returns the same name',
          () {
        expect(findNextFileName("./", filename: "README (1).md"),
            equals("README (1).md"));
      });

      test('for not existing file in some directory returns the same name', () {
        expect(
            findNextFileName("test/example-test-files/", filename: "whoami.js"),
            equals("whoami.js"));
      });

      test(
          'for existing file in some directory returns name with number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files", filename: "mytests.js"),
            equals("mytests (1).js"));
      });

      test(
          'for "./example-test-files", filename: "README (1).md" return "README (1).md"',
          () {
        expect(
            findNextFileName("./example-test-files",
                filename: "index (1).html"),
            equals("index (1).html"));
      });

      test(
          'for existing file with number in brackets returns name with the old number part unchanged and new number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "myfile (1).doc"),
            equals("myfile (1) (1).doc"));
      });
      test(
          'for existing file with number in brackets and "continueCounting = false" returns name with the old number part unchanged and new number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "myfile (1).doc", continueCounting: false),
            equals("myfile (1) (1).doc"));
      });

      test(
          'for existing file with number in brackets and "continueCounting = true" returns name with next number in brackets relative to the existing one',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "myfile (1).doc", continueCounting: true),
            equals("myfile (2).doc"));
      });

      test(
          'for NOT existing file and "continueCounting = false" returns the name with number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "whoami.js", continueCounting: false),
            equals("whoami.js"));
      });
      test(
          'for NOT existing file and "continueCounting = true" returns the name with number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "whoami.js", continueCounting: true),
            equals("whoami.js"));
      });

      test(
          'for NOT existing file with number in brackets and "continueCounting = true" returns the same name',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "myfile (2).doc", continueCounting: true),
            equals("myfile (2).doc"));
      });

      test(
          'for existing file and "continueCounting = true" returns the name with number in brackets',
          () {
        expect(
            findNextFileName("test/example-test-files/",
                filename: "test.html", continueCounting: true),
            equals("test (1).html"));
      });

      test('for invalid file name should throw an argument error', () {
        Object? error;
        try {
          var a = findNextFileName("test/example-test-files/");
        } catch (err) {
          error = err;
        }

        expect(
          error,
          isA<ArgumentError>().having(
              (error) => error.message, 'message', filenameArgumentErrorMsg),
        );
      });
    });
  });
}

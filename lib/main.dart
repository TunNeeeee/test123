import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(QuizApp());
}

// Lớp Question
class Question {
  final String questionText;
  final List<String> options;
  final String correctAnswer;
  final String? imageUrl; // Optional: Thêm trường hình ảnh nếu cần

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
    this.imageUrl,
  });

  // Factory method để tạo Question từ JSON nếu bạn muốn mở rộng sau này
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      questionText: json['questionText'],
      options: List<String>.from(json['options']),
      correctAnswer: json['correctAnswer'],
      imageUrl: json['imageUrl'],
    );
  }
}

// Lớp QuizCategory
class QuizCategory {
  final String title;
  final List<Question> questions;

  QuizCategory({
    required this.title,
    required this.questions,
  });
}

// Các bộ câu hỏi
final List<Question> interactivityQuestions = [
  Question(
    questionText: 'Interactivity trong thiết kế giao diện người dùng đề cập đến gì?',
    options: [
      'Sự ổn định của ứng dụng',
      'Tương tác của người dùng với ứng dụng',
      'Hiệu suất xử lý của ứng dụng',
      'Độ bảo mật của ứng dụng'
    ],
    correctAnswer: 'Tương tác của người dùng với ứng dụng',
  ),
  Question(
    questionText: 'Widget nào trong Flutter được sử dụng để tạo nút bấm tương tác?',
    options: ['Container', 'ElevatedButton', 'Text', 'Image'],
    correctAnswer: 'ElevatedButton',
  ),
  Question(
    questionText: 'Trong Flutter, widget nào sau đây cho phép người dùng nhập dữ liệu?',
    options: ['Text', 'Image', 'TextField', 'Container'],
    correctAnswer: 'TextField',
  ),
  Question(
    questionText: 'Tính năng nào sau đây giúp cải thiện tính tương tác của ứng dụng?',
    options: [
      'Thêm nhiều hình ảnh nền',
      'Sử dụng animation và hiệu ứng chuyển động',
      'Giảm kích thước ứng dụng',
      'Tăng độ phân giải của màn hình'
    ],
    correctAnswer: 'Sử dụng animation và hiệu ứng chuyển động',
  ),
  Question(
    questionText: 'GestureDetector trong Flutter được sử dụng để làm gì?',
    options: [
      'Xử lý các sự kiện cảm ứng như chạm, vuốt',
      'Thêm hình ảnh vào ứng dụng',
      'Tạo bố cục cho ứng dụng',
      'Quản lý trạng thái của ứng dụng'
    ],
    correctAnswer: 'Xử lý các sự kiện cảm ứng như chạm, vuốt',
  ),
  Question(
    questionText: 'Widget nào sau đây cho phép người dùng cuộn nội dung trong Flutter?',
    options: ['Row', 'Column', 'ListView', 'Container'],
    correctAnswer: 'ListView',
  ),
  Question(
    questionText: 'Trong Flutter, để xử lý sự kiện khi người dùng nhấn vào một widget, bạn sử dụng thuộc tính nào?',
    options: ['onPressed', 'onTap', 'onClick', 'onInteract'],
    correctAnswer: 'onPressed',
  ),
  Question(
    questionText: 'StatefulWidget trong Flutter được sử dụng khi nào?',
    options: [
      'Khi widget không thay đổi trạng thái',
      'Khi widget có thể thay đổi trạng thái',
      'Khi muốn tối ưu hiệu suất',
      'Khi không cần tái sử dụng widget'
    ],
    correctAnswer: 'Khi widget có thể thay đổi trạng thái',
  ),
  Question(
    questionText: 'Trong Flutter, widget nào sau đây giúp tạo thanh cuộn ngang?',
    options: ['ListView', 'SingleChildScrollView', 'Row', 'Column'],
    correctAnswer: 'SingleChildScrollView',
  ),
  Question(
    questionText: 'AnimationController trong Flutter được sử dụng để làm gì?',
    options: [
      'Quản lý trạng thái của widget',
      'Tạo và kiểm soát các hiệu ứng chuyển động',
      'Thêm hình ảnh vào ứng dụng',
      'Quản lý dữ liệu người dùng'
    ],
    correctAnswer: 'Tạo và kiểm soát các hiệu ứng chuyển động',
  ),
];

final List<Question> flutterWidgetsQuestions = [
  // ... (Những câu hỏi về Flutter Widgets đã định nghĩa ở phần trước)
];

final List<Question> generalProgrammingQuestions = [
  // ... (Những câu hỏi về General Programming đã định nghĩa ở phần trước)
];

// Bộ câu hỏi về Mobile Development (Ví dụ)
final List<Question> mobileDevelopmentQuestions = [
  Question(
    questionText: 'Flutter là framework được phát triển bởi công ty nào?',
    options: ['Apple', 'Microsoft', 'Google', 'Facebook'],
    correctAnswer: 'Google',
  ),
  // Thêm các câu hỏi khác
];

// Bộ câu hỏi về Data Structures (Ví dụ)
final List<Question> dataStructuresQuestions = [
  Question(
    questionText: 'Cấu trúc dữ liệu nào sau đây có tính chất FIFO?',
    options: ['Stack', 'Queue', 'Tree', 'Graph'],
    correctAnswer: 'Queue',
  ),
  // Thêm các câu hỏi khác
];

// Lớp QuizApp
class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ứng Dụng Trắc Nghiệm',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Trang Chủ (HomePage)
class HomePage extends StatelessWidget {
  // Danh sách các bộ câu hỏi
  final List<QuizCategory> categories = [
    QuizCategory(
      title: 'Interactivity',
      questions: interactivityQuestions,
    ),
    QuizCategory(
      title: 'Flutter Widgets',
      questions: flutterWidgetsQuestions,
    ),
    QuizCategory(
      title: 'General Programming',
      questions: generalProgrammingQuestions,
    ),
    QuizCategory(
      title: 'Mobile Development',
      questions: mobileDevelopmentQuestions,
    ),
    QuizCategory(
      title: 'Data Structures',
      questions: dataStructuresQuestions,
    ),
    // Thêm các bộ câu hỏi khác tại đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn Bộ Câu Hỏi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Số cột
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2, // Tỷ lệ chiều rộng/chiều cao của mỗi ô
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(category: category),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 5,
              ),
              child: Center(
                child: Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Màn hình Trắc Nghiệm (QuizScreen)
class QuizScreen extends StatefulWidget {
  final QuizCategory category;

  QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _answered = false;
  String _selectedOption = '';

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  void _initializeQuiz() {
    // Tạo một bản sao của danh sách câu hỏi để tránh thay đổi dữ liệu gốc
    _questions = List<Question>.from(widget.category.questions);
    _shuffleQuestions();
    for (var question in _questions) {
      _shuffleOptions(question.options);
    }
    _currentQuestionIndex = 0;
    _score = 0;
    _answered = false;
    _selectedOption = '';
  }

  void _shuffleQuestions() {
    _questions.shuffle(Random());
  }

  void _shuffleOptions(List<String> options) {
    options.shuffle(Random());
  }

  void _selectOption(String option) {
    if (_answered) return;

    setState(() {
      _selectedOption = option;
      _answered = true;
      if (option == _questions[_currentQuestionIndex].correctAnswer) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex++;
      _answered = false;
      _selectedOption = '';
    });
  }

  void _resetQuiz() {
    setState(() {
      _initializeQuiz();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Nếu đã hoàn thành tất cả câu hỏi
    if (_currentQuestionIndex >= _questions.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Kết Quả Trắc Nghiệm'),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.emoji_events,
                      color: Colors.red,
                      size: 100,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Bạn đã hoàn thành trắc nghiệm!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Điểm của bạn: $_score / ${_questions.length}',
                      style: TextStyle(fontSize: 22, color: Colors.green[700]),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton.icon(
                      onPressed: _resetQuiz,
                      icon: Icon(Icons.refresh),
                      label: Text('Làm Lại'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        backgroundColor: Colors.teal,
                        textStyle: TextStyle(fontSize: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Hiển thị câu hỏi hiện tại
    Question currentQuestion = _questions[_currentQuestionIndex];
    double progress = (_currentQuestionIndex + 1) / _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              // Thanh tiến trình
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey[300],
                color: Colors.teal,
                minHeight: 10,
              ),
              SizedBox(height: 20),
              // Hiển thị câu hỏi trong Card
              Card(
                color: Colors.white,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Câu ${_currentQuestionIndex + 1}/${_questions.length}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.teal[700],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        currentQuestion.questionText,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Hiển thị các lựa chọn
                      ...currentQuestion.options.map((option) {
                        bool isSelected = _selectedOption == option;
                        Color optionColor = Colors.teal;

                        if (_answered) {
                          if (option == currentQuestion.correctAnswer) {
                            optionColor = Colors.green;
                          } else if (isSelected && option != currentQuestion.correctAnswer) {
                            optionColor = Colors.red;
                          } else {
                            optionColor = Colors.grey;
                          }
                        }

                        return Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ElevatedButton(
                            onPressed: () => _selectOption(option),
                            child: Text(
                              option,
                              style: TextStyle(fontSize: 18),
                            ),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: optionColor,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Nút tiếp theo
              if (_answered)
                ElevatedButton.icon(
                  onPressed: _nextQuestion,
                  icon: Icon(Icons.arrow_forward),
                  label: Text(
                    _currentQuestionIndex + 1 < _questions.length
                        ? 'Câu Tiếp Theo'
                        : 'Hoàn Thành',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.teal,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

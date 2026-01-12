-- Tabela de alunos
CREATE TABLE Students (
  student_id INT PRIMARY KEY,
  name VARCAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  signup_date DATE
);
-- Tabela de cursos
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    created_at DATE
);
-- Tabela de matrículas (relacionamento N-N entre students e courses)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
  -- Tabela de aulas
CREATE TABLE lessons (
    lesson_id INT PRIMARY KEY,
    course_id INT,
    title VARCHAR(100),
    lesson_order INT,
    duration_minutes INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- Tabela de progresso do aluno
CREATE TABLE progress (
    progress_id INT PRIMARY KEY,
    student_id INT,
    lesson_id INT,
    completed BOOLEAN,
    completed_at DATE,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(lesson_id)

cat("\014")                     # Очистити консоль
rm(list = ls(all.names = TRUE)) # Очистити середовище

# ---- install-packages -------------------------------------------------------
# Встановлення необхідних пакетів, якщо вони ще не встановлені

if (!require(swirl, quietly = TRUE)) {
  install.packages("swirl")
}

if (!require(swirlify, quietly = TRUE)) {
  install.packages("swirlify")
}

# ---- load-packages -----------------------------------------------------------
library(swirl) # courses
library(swirlify) # customization of swirl

# ---- load-course -------------------------------------------------------------

# Шлях до перекладеного українського курсу
course_path <- file.path("./swirl-courses/R_Programming_Alt/")

# Перевіримо, чи існує шлях
if (dir.exists(course_path)) {
  cat("✓ Шлях до курсу знайдено:", course_path, "\n")
  
  # Встановимо та завантажимо курс
  install_course_directory(course_path)
  cat("✓ Курс успішно встановлено!\n")
  
  # Переглянемо доступні курси
  cat("\nДоступні курси:\n")
  print(installed_courses())
  
} else {
  cat("✗ Помилка: Шлях до курсу не знайдено:", course_path, "\n")
}

# ---- test-instructions ------------------------------------------------------

cat("\n", rep("=", 60), "\n", sep="")
cat("ІНСТРУКЦІЇ ДЛЯ ТЕСТУВАННЯ УКРАЇНСЬКОГО КУРСУ:\n")
cat(rep("=", 60), "\n", sep="")
cat("1. Цей скрипт встановив перекладений курс R_Programming_Alt\n")
cat("2. Тепер запустіть swirl() в консолі:\n")
cat("   > swirl()\n")
cat("3. Оберіть курс 'R Programming Alt' зі списку\n")
cat("4. Оберіть урок 'Basic Building Blocks'\n")
cat("5. Протестуйте переклад та функціональність\n")
cat(rep("=", 60), "\n", sep="")

# Функція для швидкого запуску
start_ukrainian_course <- function() {
  cat("Запуск українського курсу...\n")
  swirl()
}

cat("Для швидкого запуску наберіть: start_ukrainian_course()\n")

# ДЕМОНСТРАЦІЯ ВИКОРИСТАННЯ УКРАЇНСЬКИХ ФРАЗ У SWIRL
# DEMONSTRATION OF USING UKRAINIAN PHRASES IN SWIRL

# ==============================================================================
# КРОК 1: НАЛАШТУВАННЯ / STEP 1: SETUP
# ==============================================================================

# Завантажуємо swirl (якщо не встановлений, спочатку встанови: install.packages("swirl"))
library(swirl)

# Завантажуємо наші українські фрази
source("ukrainian_phrases.R")

# ==============================================================================
# КРОК 2: АКТИВАЦІЯ / STEP 2: ACTIVATION
# ==============================================================================

# Активуємо українські фрази
activate_ukrainian_phrases()

# ==============================================================================
# КРОК 3: ДЕМОНСТРАЦІЯ / STEP 3: DEMONSTRATION
# ==============================================================================

cat("🇺🇦 ДЕМОНСТРАЦІЯ УКРАЇНСЬКИХ ФРАЗ 🇺🇦\n")
cat("🇺🇦 UKRAINIAN PHRASES DEMONSTRATION 🇺🇦\n\n")

cat("Приклади фраз похвали (які ти побачиш при правильних відповідях):\n")
for(i in 1:5) {
  cat(paste("✓", praise_ua(), "\n"))
}

cat("\nПриклади фраз 'спробуй ще раз' (які ти побачиш при неправильних відповідях):\n")
for(i in 1:5) {
  cat(paste("✗", tryAgain_ua(), "\n"))
}

cat("\n" %R% paste(rep("=", 60), collapse="") %R% "\n")
cat("ГОТОВО! Тепер можеш запустити:\n")
cat("READY! Now you can run:\n\n")
cat("swirl()\n\n")
cat("І ти побачиш українські повідомлення під час проходження курсу!\n")
cat("And you will see Ukrainian messages while taking the course!\n")
cat(paste(rep("=", 60), collapse="") %R% "\n")

# ==============================================================================
# ДОДАТКОВІ ФУНКЦІЇ / ADDITIONAL FUNCTIONS
# ==============================================================================

# Функція для швидкого тестування
quick_test <- function() {
  cat("Швидкий тест фраз:\n")
  cat("Quick phrases test:\n")
  cat("Похвала:", praise_ua(), "\n")
  cat("Спробуй ще раз:", tryAgain_ua(), "\n")
}

# Функція перевірки статусу
check_status <- function() {
  if(exists("praise", envir=asNamespace("swirl"))) {
    # Перевіряємо чи наша функція активна
    test_praise <- get("praise", envir=asNamespace("swirl"))
    if(identical(test_praise, praise_ua)) {
      cat("✓ Українські фрази АКТИВНІ\n")
      cat("✓ Ukrainian phrases ACTIVE\n")
    } else {
      cat("✗ Англійські фрази активні\n") 
      cat("✗ English phrases active\n")
    }
  }
}

cat("\nДоступні команди:\n")
cat("Available commands:\n")
cat("- quick_test()   # швидкий тест фраз\n")
cat("- check_status() # перевірка статусу\n")
cat("- swirl()        # запуск курсу з українськими фразами\n")

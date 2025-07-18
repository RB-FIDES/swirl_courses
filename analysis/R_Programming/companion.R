cat("\014")                     # Clear console
rm(list = ls(all.names = TRUE)) # Clear the environment
# ---- install-packages -------------------------------------------------------
# Install required packages if not already installed
# Встановлення необхідних пакетів, якщо вони ще не встановлені

if (!require(swirl, quietly = TRUE)) {
  install.packages("swirl")
}

if (!require(swirlify, quietly = TRUE)) {
  install.packages("swirlify")
}

# ---- load-sources ------------------------------------------------------------
library(swirl) # courses
library(swirlify) # customization of swirl
# ---- load-packages -----------------------------------------------------------
# ---- declare-globals ---------------------------------------------------------

# swirl::uninstall_all_courses()  
# Path to custom swirl course (шлях до користувацького курсу swirl)
course_path <- file.path("./swirl-courses/R_Programming_Alt/")
# Install and load the custom course (встановлення та завантаження курсу)
swirl::install_course_directory(course_path)

# ---- load-data ---------------------------------------------------------------

# INSTRUCTIONS FOR RUNNING CUSTOM SWIRL COURSE:
# Інструкції для запуску користувацького курсу swirl:
# 
# 1. Run this script up to the install_course_directory() line
#    Запустіть цей скрипт до рядка install_course_directory()
# 
# 2. Then run swirl() to start the interactive session
#    Потім запустіть swirl() для початку інтерактивної сесії
# 
# 3. Follow the prompts to select your course and lesson
#    Слідуйте підказкам для вибору курсу та уроку

# ===============================================================================
# 🇺🇦 УКРАЇНІЗАЦІЯ SWIRL - ПУТІВНИК ДЛЯ ГАЛІ 🇺🇦
# UKRAINIAN SWIRL GUIDE - YOUR GUIDE TO LEARNING R IN UKRAINIAN
# ===============================================================================

cat("🇺🇦 Вітаю у світі R програмування українською мовою!\n")
cat("🇺🇦 Welcome to the world of R programming in Ukrainian!\n\n")

# ---- ВИБІР РІВНЯ УКРАЇНІЗАЦІЇ / CHOOSE UKRAINIZATION LEVEL ------------------

cat("ДОСТУПНІ РІВНІ УКРАЇНІЗАЦІЇ / AVAILABLE UKRAINIZATION LEVELS:\n")
cat("🥉 БАЗОВИЙ: Тільки фрази похвали/помилок\n")
cat("🥈 РОЗШИРЕНИЙ: Фрази + основні повідомлення\n") 
cat("🥇 ПОВНИЙ: ВСІ діалоги українською (рекомендовано!)\n\n")

# Запитуємо користувача про рівень
cat("Який рівень українізації обрати?\n")
cat("1 - Базовий (тільки фрази)\n")
cat("2 - Розширений (фрази + повідомлення)\n")
cat("3 - Повний (все українською) 🌟\n")
cat("Просто розкоментуй відповідний розділ нижче!\n\n")

# ===============================================================================
# ОПЦІЯ 1: 🥉 БАЗОВИЙ РІВЕНЬ (розкоментуй цей блок)
# ===============================================================================
# library(swirl)
# source("../../ukrainian_phrases.R")
# activate_ukrainian_phrases()
# cat("✅ Базова українізація активована!\n")
# swirl()

# ===============================================================================  
# ОПЦІЯ 2: 🥈 РОЗШИРЕНИЙ РІВЕНЬ (розкоментуй цей блок)
# ===============================================================================
# library(swirl)
# source("../../setup_ukrainian_swirl.R")
# cat("✅ Розширена українізація активована!\n")
# swirl()

# ===============================================================================
# ОПЦІЯ 3: 🥇 ПОВНИЙ РІВЕНЬ - РЕКОМЕНДОВАНО! (розкоментуй цей блок)
# ===============================================================================
library(swirl)
# Перевіряємо чи існують файли
if(file.exists("./ukrainian_phrases.R") && file.exists("./full_ukrainian_swirl.R")) {
  source("./ukrainian_phrases.R")
  source("./full_ukrainian_swirl.R")  
  activate_full_ukrainian_swirl()
  cat("🎉 ПОВНА українізація активована! Весь swirl тепер розмовляє українською!\n")
  cat("🎉 FULL ukrainization activated! All of swirl now speaks Ukrainian!\n\n")
} else {
  cat("❌ Файли українізації не знайдені. Перевір шлях до файлів.\n")
  cat("❌ Ukrainization files not found. Check the file path.\n")
  cat("Спробуй запустити з кореневої папки проекту.\n")
  cat("Try running from the project root folder.\n\n")
}

# ===============================================================================
# 🚀 ЗАПУСК SWIRL З УКРАЇНСЬКИМИ ПОВІДОМЛЕННЯМИ
# ===============================================================================

cat("🚀 Готова вивчати R українською? Запускаємо swirl!\n")
cat("🚀 Ready to learn R in Ukrainian? Starting swirl!\n\n")

cat("Що тебе чекає:\n")
cat("✓ Привітання українською: 'Ласкаво просимо до swirl!'\n")
cat("✓ Запит імені: 'Як мені тебе називати?'\n") 
cat("✓ Меню українською: 'Будь ласка, вибери курс'\n")
cat("✓ Похвала: 'Чудова робота, Галю!'\n")
cat("✓ Підказки: 'Спробуй ще раз або введи info()'\n\n")

cat("💡 КОРИСНІ КОМАНДИ:\n")
cat("info() - довідка командами українською\n")
cat("skip() - пропустити запитання\n") 
cat("play() - експериментувати вільно\n")
cat("nxt() - продовжити урок\n")
cat("bye() - вийти і зберегти прогрес\n\n")

# Запускаємо swirl
swirl()

# ---- tweak-data --------------------------------------------------------------

# ---- tweak-data-1 ------------------------------------------------------------

# ALTERNATIVE METHOD (альтернативний метод):
# If you want to check available courses first:
# Якщо ви хочете спочатку перевірити доступні курси:
# 
# uninstall_all_courses()  # Optional: remove other courses
# available_courses()      # See what courses are available
# install_course("Course Name")  # Install by name

# ---- table-1 -----------------------------------------------------------------

# ---- graph-1 -----------------------------------------------------------------

# ---- save-to-disk ------------------------------------------------------------
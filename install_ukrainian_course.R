# Скрипт для встановлення українського курсу R Programming
library(swirl)

# Видалити старий курс (якщо є)
cat("Видаляю старий курс R Programming...\n")
try(uninstall_course("R Programming"), silent = TRUE)

# Встановити твій український курс
cat("Встановлюю український курс R Programming...\n")
install_course_directory("C:/Users/muaro/Documents/GitHub/swirl_courses/swirl-courses/R_Programming_Alt")

# Показати доступні курси
cat("\nДоступні курси після встановлення:\n")
print(installed_courses())

# Запустити swirl
cat("\nЗапускаю swirl...\n")
cat("Вибери курс 'R Programming' та урок 'Missing Values'\n\n")
swirl()

# ДОСЛІДЖЕННЯ ФУНКЦІЙ SWIRL ДЛЯ ПОВНОГО ПЕРЕКЛАДУ
# EXPLORING SWIRL FUNCTIONS FOR COMPLETE TRANSLATION

library(swirl)

# Отримуємо всі функції з namespace swirl
all_functions <- ls(envir=asNamespace('swirl'))

# Шукаємо функції пов'язані з діалогами та повідомленнями
dialog_functions <- all_functions[grepl('menu|dialog|message|prompt|info|help|skip|play|nxt|bye|main|select|course|lesson', all_functions, ignore.case=TRUE)]

cat("ФУНКЦІЇ ДЛЯ ДІАЛОГІВ:\n")
print(dialog_functions)

# Також шукаємо функції з типовими назвами для повідомлень
message_functions <- all_functions[grepl('msg|txt|text|print|cat|readline|readLines', all_functions, ignore.case=TRUE)]

cat("\nФУНКЦІЇ ДЛЯ ПОВІДОМЛЕНЬ:\n") 
print(message_functions)

# Дивимося на загальний список
cat("\nВСІ ФУНКЦІЇ SWIRL (перші 50):\n")
print(head(all_functions, 50))

# Перевіряємо, які функції містять текстові рядки
cat("\nПЕРЕВІРЯЄМО ДЕЯКІ КЛЮЧОВІ ФУНКЦІЇ:\n")

# Перевіряємо функції, які можуть містити тексти
key_functions <- c("mainMenu", "courseMenu", "lessonMenu", "infoMenu", "playMenu")
existing_functions <- key_functions[key_functions %in% all_functions]

for(func in existing_functions) {
  cat(paste("\n--- Функція:", func, "---\n"))
  try({
    func_body <- body(get(func, envir=asNamespace('swirl')))
    if(length(func_body) > 0) {
      print(func_body)
    }
  }, silent=TRUE)
}

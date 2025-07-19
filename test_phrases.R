# Простий тест українських фраз
source("ukrainian_phrases.R")

cat("=== ТЕСТ УКРАЇНСЬКИХ ФРАЗ ===\n\n")

cat("Фрази похвали:\n")
for(i in 1:5) {
  cat(paste("  ", i, ".", praise_ua(), "\n"))
}

cat("\nФрази 'спробуй ще раз':\n")
for(i in 1:5) {
  cat(paste("  ", i, ".", tryAgain_ua(), "\n"))
}

cat("\n=== ТЕСТ ЗАВЕРШЕНО ===\n")

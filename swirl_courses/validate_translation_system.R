if (!file.exists("swirl_courses/ukrainian_translation.json")) {
  stop("Ukrainian translation file is missing.")
}

translation_data <- jsonlite::fromJSON("swirl_courses/ukrainian_translation.json")

if (length(translation_data) == 0) {
  stop("Translation data is empty.")
}

required_keys <- c("lesson_title", "lesson_content", "quiz_questions")

for (key in required_keys) {
  if (!key %in% names(translation_data)) {
    stop(paste("Missing key in translation data:", key))
  }
}

cat("Translation system validation passed. All necessary keys are present.")
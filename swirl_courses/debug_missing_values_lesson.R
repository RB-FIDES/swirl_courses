print("Debugging Missing Values Lesson Translation")

# Check if the translation files are loaded
translation_file <- "path/to/ukrainian_translation_file.json"
if (!file.exists(translation_file)) {
  print("Translation file does not exist.")
} else {
  print("Translation file loaded successfully.")
}

# Load the translation data
translation_data <- jsonlite::fromJSON(translation_file)

# Check for missing keys in the translation data
expected_keys <- c("key1", "key2", "key3") # Replace with actual keys
missing_keys <- setdiff(expected_keys, names(translation_data))
if (length(missing_keys) > 0) {
  print(paste("Missing keys in translation data:", paste(missing_keys, collapse = ", ")))
} else {
  print("All expected keys are present in the translation data.")
}

# Example of checking the output of a specific translation
test_key <- "key1" # Replace with an actual key to test
if (test_key %in% names(translation_data)) {
  print(paste("Translation for", test_key, ":", translation_data[[test_key]]))
} else {
  print(paste("No translation found for", test_key))
}
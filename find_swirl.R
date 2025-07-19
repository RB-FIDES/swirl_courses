# Знаходимо розташування swirl
swirl_path <- find.package("swirl")
cat("Swirl встановлений у:", swirl_path, "\n")

# Дивимося на структуру
r_files <- list.files(file.path(swirl_path, "R"), pattern = "*.R", full.names = TRUE)
cat("R файли в swirl:\n")
for(file in r_files) {
  cat("-", basename(file), "\n")
}

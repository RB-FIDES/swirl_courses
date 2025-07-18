# ==============================================================================
# Update Copilot Instructions Context
# ==============================================================================
# 
# This script automates the process of updating .github/copilot-instructions.md
# with the contents of foundational project files. It allows analysts to quickly
# refresh the AI context by typing: add_to_instructions("glossary", "mission", ...)
#
# Author: GitHub Copilot (with human analyst)
# Created: 2025-07-16

update_copilot_instructions <- function(file_list) {
  # Map friendly names to actual file paths
  file_map <- list(
    "glossary" = "./ai/glossary.md",
    "mission" = "./ai/mission.md", 
    "onboarding-ai" = "./ai/onboarding-ai.md",
    "semiology" = "./ai/semiology.md",
    "pipeline" = "./pipeline.md",
    "research-request" = "./data-private/raw/research_request.md",
    "rdb-manifest" = "./ai/RDB-manifest.md",
    "fides" = "./ai/FIDES.md",
    "method" = "./ai/method.md"
  )
  
  instructions_path <- ".github/copilot-instructions.md"
  
  # Check if instructions file exists
  if (!file.exists(instructions_path)) {
    stop("Copilot instructions file not found at: ", instructions_path)
  }
  
  # Read the current copilot instructions
  current_content <- readLines(instructions_path, warn = FALSE)
  
  # Find the dynamic content section markers
  start_marker <- which(grepl("<!-- DYNAMIC CONTENT START -->", current_content))
  end_marker <- which(grepl("<!-- DYNAMIC CONTENT END -->", current_content))
  
  if (length(start_marker) == 0 || length(end_marker) == 0) {
    stop("Dynamic content markers not found in copilot instructions. Please add:\n<!-- DYNAMIC CONTENT START -->\n<!-- DYNAMIC CONTENT END -->")
  }
  
  # Build new content section
  new_content <- c("<!-- DYNAMIC CONTENT START -->", "")
  
  for (file_name in file_list) {
    if (file_name %in% names(file_map)) {
      file_path <- file_map[[file_name]]
      if (file.exists(file_path)) {
        file_content <- readLines(file_path, warn = FALSE)
        new_content <- c(
          new_content,
          paste0("### ", tools::toTitleCase(gsub("-", " ", file_name)), " (from `", file_path, "`)"),
          "```markdown",
          file_content,
          "```",
          ""
        )
        message("✓ Added: ", file_path)
      } else {
        warning("✗ File not found: ", file_path)
      }
    } else {
      warning("✗ Unknown file alias: ", file_name, ". Available: ", paste(names(file_map), collapse=", "))
    }
  }
  
  # Don't add the closing marker here - we'll use the existing one
  
  # Replace the section (including both markers)
  updated_content <- c(
    current_content[1:(start_marker-1)],
    new_content,
    current_content[end_marker:length(current_content)]
  )
  
  # Write back
  writeLines(updated_content, instructions_path)
  
  # Ensure file ends with newline to prevent warnings
  if (length(updated_content) > 0 && !endsWith(updated_content[length(updated_content)], "\n")) {
    cat("\n", file = instructions_path, append = TRUE)
  }
  
  message("🔄 Updated .github/copilot-instructions.md with: ", paste(file_list, collapse=", "))
  message("📄 Total lines in updated file: ", length(updated_content))
}

# Convenience function for easy calling
add_to_instructions <- function(...) {
  file_list <- c(...)
  if (length(file_list) == 0) {
    message("Available file aliases:")
    file_map <- list(
      "glossary" = "./ai/glossary.md",
      "mission" = "./ai/mission.md", 
      "onboarding-ai" = "./ai/onboarding-ai.md",
      "semiology" = "./ai/semiology.md",
      "pipeline" = "./pipeline.md",
      "research-request" = "./data-private/raw/research_request.md",
      "rdb-manifest" = "./ai/RDB-manifest.md",
      "fides" = "./ai/FIDES.md",
      "method" = "./ai/method.md"
    )
    for (alias in names(file_map)) {
      exists_marker <- if (file.exists(file_map[[alias]])) "✓" else "✗"
      message("  ", exists_marker, " ", alias, " -> ", file_map[[alias]])
    }
    message("\nUsage: add_to_instructions('glossary', 'mission', 'semiology')")
  } else {
    update_copilot_instructions(file_list)
  }
}

# Quick alias for common combinations
add_core_context <- function() {
  add_to_instructions("mission", "glossary", "semiology", "pipeline")
}

add_full_context <- function() {
  add_to_instructions("mission", "glossary", "semiology", "pipeline", "research-request", "rdb-manifest")
}

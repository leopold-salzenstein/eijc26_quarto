# Load library
library(tidyverse)
library(here)

# Set up working directory

here::i_am("render_country_files.R")

# Make list of countries to analyse
countries_to_analyze <- c("Belgium", "France", "Germany", "Luxembourg", "Netherlands")

# Set template file
template_file <- here("country_template.qmd")

# Set output directory

output_dir <- here("Results")

# Make rendering function
render_country <- function(country_name) {
  filename <- str_glue("RESULTS_{str_replace_all(country_name, ' ', '_')}.html")
  quarto::quarto_render(
    input = template_file,
    execute_params = list(country = country_name),
    output_file = filename
  )
  file.rename(from = filename, to = file.path(output_dir, filename))
}

# Run rendering function
walk(countries_to_analyze, render_country)

# Move files to the Results folder



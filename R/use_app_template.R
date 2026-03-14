# Creates shiny app in existing working directory

#' Scaffold shiny app in current working directory
#' @description This function will create files and folders in the
#' user's current working directory...
#' @param template One of vanilla_shiny, shiny_dashboard_modules,
#' bslib_top_modules, module_template
#'
#' @export
use_app_template <- function(template = 'bslib_top_modules') {

    template <- match.arg(template,
        c('vanilla_shiny', 'shiny_dashboard_modules',
          'bslib_top_modules', 'module_template'
        )
    )

    source_dir <- system.file(
        paste0("app_templates/", template),
        package = "dphshiny"
    )

    destination_dir <- paste0(getwd(), '/', template)

    ## Determine and create folders

    folders_to_copy <- list.files(source_dir, full.names = TRUE, recursive = FALSE)
    destination_paths <- sub(source_dir, destination_dir, folders_to_copy)
    dirs_to_create <- unique(destination_paths[file.info(folders_to_copy)$isdir])

    for (dir in dirs_to_create) {
        if (!dir.exists(dir)) {
            dir.create(dir, recursive = TRUE)
        }
    }

    ## Copy files

    files_to_copy <- list.files(source_dir, full.names = TRUE, recursive = TRUE)
    file_destination_paths <- sub(source_dir, destination_dir, files_to_copy)

    for(i in seq_along(files_to_copy)) {
        file.copy(files_to_copy[[i]], file_destination_paths[[i]])
    }




}

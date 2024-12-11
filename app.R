## This bit is used by shinylive to run the app

pkgload::load_all(".") # Load the package
scpopulation_app()

## run this in the console to export the app to docs/articles
## shinylive::export(appdir='.', destdir='docs/articles')

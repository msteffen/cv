# Usage of 'latex_document' copied from:
# https://github.com/ProdriveTechnologies/bazel-latex/blob/c552d5bd09e4e9e49040ede60dd97720acb1cbb7/README.md

load("@bazel_latex//:latex.bzl", "latex_document")

latex_document(
  name = "cv",
  srcs = [
    "@bazel_latex//packages:geometry", # for adjusting page geometry
    "@bazel_latex//packages:titlesec", # for customizing section titles
    "@bazel_latex//packages:tabularx", # for making tables with fixed width columns
    "@bazel_latex//packages:array", # tabularx requires this
    "@bazel_latex//packages:xcolor", # for coloring text
    "@bazel_latex//packages:enumitem", # for customizing lists
    "@bazel_latex//packages:fontawesome5", # for using icons
    "@bazel_latex//packages:amsmath", # for math
    "@bazel_latex//packages:hyperref", # for links, metadata and bookmarks
    "@bazel_latex//packages:eso-pic", # for floating text on the page
    "@bazel_latex//packages:calc", # for calculating lengths
    "@bazel_latex//packages:bookmark", # for bookmarks
    "@bazel_latex//packages:lastpage", # for getting the total number of pages
    "@bazel_latex//packages:changepage", # for one column entries (adjustwidth environment)
    "@bazel_latex//packages:paracol", # for two and three column entries
    "@bazel_latex//packages:ifthen", # for conditional statements
    "@bazel_latex//packages:needspace", # for avoiding page brake right after the section title
    "@bazel_latex//packages:iftex", # check if engine is pdflatex, xetex or luatex
    "@bazel_latex//packages:inputenc",
    "@bazel_latex//packages:moderncv",
  ],
  main = "cv.tex",
)

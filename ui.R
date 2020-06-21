## Capstone: Coursera Data Science
## Final Project

library(shiny)
library(markdown)
library(shinythemes)
library(stringr)
library(tm)

## SHINY UI
shinyUI(
  navbarPage("Next Word Predict",
             theme = shinytheme("spacelab"),
             tabPanel("Simple Backoff Model",
                      fluidPage(
                              titlePanel("Simple Backoff Model"),
                              sidebarLayout(
                                      sidebarPanel(
                                              helpText("Please enter a word or short phrase to see the next word prediction"),
                                              hr(),
                                              textInput("userInput1", "User Input (word or phrase):",
                                                        value = "",
                                                        placeholder = "Enter text here"),
                                              br(),
                                              ),
                                      
                                      mainPanel(
                                              h4("User Input"),
                                              verbatimTextOutput("userSentence1"),
                                              br(),
                                              h4("Next Word Prediction"),
                                              verbatimTextOutput("prediction1"),
                                              hr(),
                                              hr(),
                                              img(src = 'coursera_logo.png', height = 122, width = 467),
                                              hr()
                                      )
                              )
                      )
                ),
             tabPanel("Probabilistic Backoff Model",
                      fluidPage(
                        titlePanel("Probabilistic Backoff Model"),
                        sidebarLayout(
                          sidebarPanel(
                            helpText("Please enter a word or short phrase to see the next word prediction"),
                            hr(),
                            textInput("userInput2", "User Input (word or phrase):",value = "",
                                      placeholder = "Enter text here"),
                          ),
                          
                          mainPanel(
                            h4("User Input"),
                            verbatimTextOutput("userSentence2"),
                            br(),
                            h4("Next Word Prediction"),
                            verbatimTextOutput("prediction2"),
                            hr(),
                            hr(),
                            img(src = 'coursera_logo.png', height = 122, width = 467),
                            hr()
                          )
                        )
                      )
             ),
             tabPanel("Linear Interpolation Model",
                      fluidPage(
                        titlePanel("Linear Interpolation Model"),
                        sidebarLayout(
                          sidebarPanel(
                            helpText("Please enter a word or short phrase to see the next word prediction"),
                            hr(),
                            textInput("userInput3", "User Input (word or phrase):",value = "",
                                      placeholder = "Enter text here"),
                          ),
                          
                          mainPanel(
                            h4("User Input"),
                            verbatimTextOutput("userSentence3"),
                            br(),
                            h4("Next Word Prediction"),
                            verbatimTextOutput("prediction3"),
                            hr(),
                            hr(),
                            img(src = 'coursera_logo.png', height = 122, width = 467),
                            hr()
                          )
                        )
                      )
             ),
             tabPanel("About",
                      h3("About The App"),
                      br(),
                      div("This is a Shiny app that uses three different text
                            prediction algorithms to predict the next word
                            based on text entered by a user.",
                          br(),
                          br(),
                          "The first algorithm is a simple Backoff model. Given an input sequence,
                          the word shown is the one with the highest count in the largest n-gram in which
                          the input sequence appears.",
                          br(),
                          br(),
                          "The second algorithm is a probabilistic Backoff model. Rather than just showing the word
                          with the largest count, like in simple Backoff, the words shown are drawn from
                          a distribution where each word has probability of being drawn 
                          equal to count/(sum of counts).",
                          br(),
                          br(),
                          "The final algorithm is a Linear Interpolation. Rather than looking at the largest n-gram 
                           in which the input sequence appears (what we do in Backoff), we look at all the n-grams
                           in which the sequence appears. We then draw a word probabilistically from all of those n-grams,
                           and finally draw uniformly at random from those word options.
                          See https://www.cs.cornell.edu/courses/cs4740/2012sp/lectures/smoothing+backoff-1-4pp.pdf for more references.",
                          br(),
                          br(),
                          "The source code for this application can be found
                            on GitHub:",
                          br(),
                          br(),
                          a(target = "_blank", href="https://ignacio-ojea.shinyapps.io/Coursera-Data-Science-Capstone/", "Shiny App URL"),
                          br(),
                          img(src = "github.png"),
                          a(target = "_blank", href = "https://ignacio-ojea.shinyapps.io/Coursera-Data-Science-Capstone/",
                            "Next Word Predict GitHub")),
                      br(),
                      h3("About Me"),
                      br(),
                      div("My name is Ignacio Ojea Quintana, and I am currently a Research Fellow at the Australian
                          National University.",
                          br(),
                          br(),
                          "Last year I graduated with a PhD in Philosophy from Columbia University in new York.",
                          br(),
                          br(),
                          "My work in philosophy revolves around philosophy of science, social epistemology, and philosophy
                          of technology (artificial intelligence).",
                          br(),
                          br(),
                          "My other specialties include Data Science and Reinforcement Learning.",
                          br(),
                          br(),
                          a(target = "_blank", href="http://www.ignacioojea.net/", "Personal Web Page"),
                          br(),
                          img(src = "linkedin.png"),
                          a(target = "_blank", href="https://www.linkedin.com/in/ignacio-ojea-30311627/", "Linkedin"),
                          br(),
                          img(src = "github.png"),
                          a(target = "_blank", href="https://github.com/IgnacioOQ", "GitHub"))
             )
  )
)

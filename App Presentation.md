Next Word Predict App
========================================================
author: Ignacio Ojea Quintana
date: 06/21/2020
autosize: true
title: Next Word Predict App Presentation

This is a presentation for Next Word Predict App, a natural language processing application.

In this short summary we will briefly describe the app, provide instructions on how to use it, and explain the three algorithms that we used.

App Description and Instructions
========================================================

The app has four tab panels: Simple Backoff Model, Probabilistic Backoff Model, Linear Interpolation Model, and About.


The first three correspond to the three algorithms that we used. The fourth one has some information about the App and the developer.


In each of the first three tab panels, there is a left bar in which the user can type their word or phrase input. On the right main panel the user can see what their input was, and what is the predicted next word given that input. The app reacts automatically without the need for the user to accept the input or press enter. It is as simple as that! 

Let me know what you think!

App Setup
========================================================

Before we go into the predictive algorithms, it is worth explaining the basic setup of the app. We begun by preprocessing the data sets given. This meant:

- Sampling 5% from each of the three corpus, to create a sample corpus that is a mixture of the given.
- Cleaning the sample. This means, for example, converting everything to lower case or removing all all non-English non-ASCII characters, profanity words, numbers, etc.
- From the cleaned sample, creating a unigram, a bigram, a trigram, and a quadgram. And saving them for the app use.

You can find this in the preprocessing file in my GitHub account: 
https://github.com/IgnacioOQ/Coursera-Data-Science-Capstone/upload/master

Simple Backoff Model
========================================================

Given an input sequence, the algorithm searches that sequence *first* in its corresponding n-gram. This is, if the sequence is of length three it will look *first* whether it appear in the quadgram. If it does, it returns the fourth word with the largest count.

If the sequence does not appear in the quadgram, then the algorithm *backs off* to the next largest n-gram, the trigram. There, it searches whether the last two words appear in the trigram. If they do, it returns the third word with the largest count. If they do not appear, it *backs off* to the bigram. An analogous process follows for all n-grams.

If we are unlucky enough that input words do not appear in our data bases, then a default message will appear: "No matches were found. Most frequent word is: the"

Probabilistic Backoff & Linear Interpolation Models
========================================================

In the simple model, the word returned is that one with the highest count. In probablisitic backoff we give each word a weight proportional to their count. Later, in order to return a word, we *sample* from all the potential words using their corresponding weights. This gives us more accuracy! Given a head biased (2/3,1/3) coin, it is better to predict heads 2/3 of the times and tails 1/3 (payoff = 5/9) than just by reporting heads all the time (payoff 2/3).

Linear Interpolation uses the same probabilistic choice, but it makes use of all the available n-grams. Given a sequence of lenght two which appears in the trigram, we know that the last word will appear in the bigram. So we (probabilistically) chose a word from *each* gram, and then we report one chosing at random. The case for larger sequences is analogous.

Many thanks for your time!

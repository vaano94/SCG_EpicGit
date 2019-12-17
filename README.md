# From User Stories to Live Documentation

This project contains the framework for this project, started in the Software Composition Seminar in Fall 2019.
The following infrastructure exists:
- AddressBook: contains an example Address Book. It has basic features implemented.
  - EpicExamples: holds an example project for improving the Address Book. It contains epics, use cases, user stories, and scenarios for features implemented and not implemented.
- Epic: contains the code for the agile framework. 

## How to Load

Run this code snippet in the playground of Pharo 8.0 and you will have access to the code.
```
Metacello new
  baseline: 'Epic';
  repository: 'github://emilyc7/SCG_EpicGit';
  load
```

## Getting Started
You can see documentation for the Epic package by typing ```Epic.``` into the playground and running.
You can start up the examples by typing ```EpicExamples.``` into the playground and running. You will see a list of the examples. The first word in the Selector name will be what category that example falls into (i.e. epic, useCase, etc.). The most logical way to step through the project will be to find an epic example (epicManageAddressBook, epicSearchAddressBook, epicMergeContacts) and run that. To see the code itself, click on the Selector name. To see the displays and components of each example, click on the Result.


## Background Knowledge

Each class in the Epic package has individual and specialized views for seeing each component and layer. You can see details about the view under "View Details".
Class comments will have information about the functions, uses, and relationships of the classes.

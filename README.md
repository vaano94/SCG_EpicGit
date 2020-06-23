# Moldable scenario editor

This project 
The following master thesis 'Moldable scenario editor' : an experiment that would allow editing and creating new scenarios and parametrized examples for agile development.

It extends from the feature of Parameterized Example implemented in GToolkit and offers a different way to observe BDD specification, play with input values, generate new examples of tests and domain model.

## How to Load

In order to access the project, download the GToolkit implementation from [GToolkit](https://gtoolkit.com/)
```
Metacello new
  baseline: 'Epic';
  repository: 'github://vaano94/SCG_EpicGit';
  load
```

## Getting Started
### Get acquainted with parametrized examples
You can start exploring by executing ```EpicExamples new board```. The structure represents simple agile requirement flow: ```Epic``` => ```Use Case``` => ```User Story``` => ```Scenario```.
Every Scenario contains a documentation part, tests as examples, and parameterized tests as parameterized examples.
Once you are inside of scenario, you can explore 'Parameterized Examples' tab. It allows to experiment with input elements and see the result of the execution by pressing 'Play/Run' button on the upper-right corner. 
If you like the result of the execution, you can save it by pressing 'Generate' button in the same tab. 
The newly opened Coder window will then show the generated code. 
Save the results by clicking on 'Save' button and observe them in Pharo environment.

### New domain objects
You can also generate new instances of domain model.
Execute ```ABScenarioModelsBuilder new``` proceed to a list with parametrized examples that allow to create new objects.
The logic is similar - generate new examples based on your provided values and save in the system.

### Editing parameterized example
Each parameterized example allows to edit its internal representation. On the 'Edit' tab, change the 'Description' and 'Label' fields. You can also edit parameters themselves by specifying their name, class, scope of search and widget type.

Create a new example by pressing 'New Parameterized Example' from the ```Scenario``` view. You can provide again label, description, method base name (without parameters), where to save and what to return. Each new parameter can be added by pressing 'Add parameter' button or deleted with a 'Close' button. The parameterized example draft can be generated after pressing 'Generate parameterized example definition' and will not contain implementation details. It can be again saved inside a system and complemented later.

### Overview tab
Overview aims to connect requirement and specification in a single interface.
You can see the power of Documenter DSL by executing ```EpicExamples new scenarioNewContact``` and browsing the 'Overview'. Overview includes all documentation, examples and parametrized examples.


You can start up the examples by typing ```EpicExample board.``` into the playground and running. You will see a list of the examples. The first word in the Selector name will be what category that example falls into (i.e. epic, useCase, etc.). The most logical way to step through the project will be to find an epic example (epicManageAddressBook, epicSearchAddressBook, epicMergeContacts) and run that. To see the code itself, click on the Selector name. To see the displays and components of each example, click on the Result.

Another way to access the examples is through the System Browser. If you search for AddressBook and click on EpicExamples, the examples have been sorted into protocols. This is an easy way to see only epic examples, for instance. Simply click the green arrow to begin and select the "\_GT" tab to see the GToolKit views.

## New widgets
To make a new widget for your Parameterized Example, simply create a new class and inherit from ```EScenarioInputWidget```.
Most often you will need to specify three methods: ```initialize``` to render appropriate BlElement, ```examples:``` to insert your examples inside a widget, and ```parameterValue``` that knows how to return a value inside a widget. 

Additionally, from class side methods you will need to declare  ```forIndex: anIndex widgetModel: aWidget parametrizedExample: aParametrizedExample``` similar as in other widgets, and ```widgetType``` to specify how your widget is called. 
Afterwards you can generate new parameterized examples with your widget.
If you want your widget to be able to generate code, either connect a trait ```BuilderStringForGtExample``` , or create a new one. The trait should access the widget value and return its insantiation code by calling ```generateString```.

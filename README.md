# Functional Validation With Bow

# Important: This repository has been deprecated. Please move to -> https://github.com/Gioevi90/SampleValidation.git

This repository consists in the implementation of some examples that show how to use functional data types to perform validation of two fields in Swift.
The fields we want to validate are an **email** field and a **phone number** field.

To reach my goal I used Bow (https://github.com/bow-swift/bow), a framework that provides useful things to do functional programming in swift.

Thanks to [Daniele Campogiani](https://github.com/dcampogiani) for the support and the inspiration that gave me. This repository is based to Daniele Campogiani's Android Functional Validation repo (https://github.com/dcampogiani/AndroidFunctionalValidation).

# Installation

In order to run the sample project, run the following commands in the root directory:

```
$ swift build
$ swift package generate-xcodeproj
```
Then open in XCode the **Validation workspace** and run the project.

# Functional Data Types

The examples in code show how to perform validation with **Option**, **Either** and **Validated** data types.

## Validation with Option

![](Option.gif)

Option Data Type provides two possible values:

* **none**: the case in which our field is not valid
* **some(_:)**: the case in which out field is valid, encapsulating the valid value.

## Validation with Either

![](Either.gif)

Either Data Type provides two possible values:

* **left(_:)**: generally, the case in which our field is not valid, encapsulating the information relative to the error that occurred. 
* **right(_:)**: the case in which out field is valid, encapsulating the valid value.

## Validation with Validated


![](Validated.gif)

Validated Data Type provides two possible values:

* **invalid(_:)**: the case in which our field is not valid, encapsulating the information relative to the error that occurred. 
* **valid(_:)**: the case in which out field is valid, encapsulating the valid value.

The main difference between **Validated** and **Either** is that **Validated** gives me the possibility to aggregate multiple errors in a **NonEmptyList** of errors, so that I can use them to present multiple errors in once.

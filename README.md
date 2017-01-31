# Techstars Engineering Coding Challenge

The Techstars Engineering team would like to congradulate you on making it to our coding challenge. This is your chance to show the team how you approach problems and give them insight into your ability to code. For the challenge you will be required to design, develop, and style a Ruby on Rails application. Feel free to use any third party Gems or libraries you see fit. Low-fi mockups have been provided but please feel free to take your own artistic direction. You will have **one week** from the time you are granted access to this repository to submit a solution for the given requirements. Please read all the instructions carefully and email us if you have any questions. Goodluck, but most of all have fun this is your chance to demonstrate what you can do. 

## Getting Started
First fork this repository into your github. Then complete each of the parts below working as you would in a professional environment. Once you are complete please update the README to reflect how to build and run your application, as well as any archicture decisions you have made. When you believe you are ready to submit your challenge put, put a pull request into our master branch. We will see the notification and get back to you on next steps. 

## What we are looking for

* Ability to setup a Rails Application
* Ability to setup a Relational Database
* Understanding of the HTTP protocal and how it works with RESTful conventions
* Understanding the basics of CRUD
  * Create
  * Read
  * Update
  * Delete
* Ability to layout and design an HTML page with CSS
* Ability to develop automated tests for your application
* Ability to interperut requierments


## The Challenge

### Intro

Please build an application that will be a directory of companies, and the people who have founded them. The main page should be a list of all the companies with some high level information (Name, Short Description, City, State). When the user click on a company its details will be shown. Included in those details will be the founding members of company, a long Description, and a collection of categories the company belongs to.

### Part 1 : Companies Index

1. Create the basic layout for the page
2. Create a list view of all companies
  * Company Name
  * Company Location
  * Short Description
3. Add ability to create a new company
<br />
<br />
![step 1](mockups/Step 1.png)

### Part 2 : Companies Create

1. Implement form to create a new company
2. Fields
    * Company Name __required__ 
    * Company Location (City, State) __required__
    * Company Description __required__
    * Founded Date
![step 2](mockups/Step 2.png)
    

### Part 3 : Company Details

1. Shows All of the companies information
2. Ability to update company
3. Ability to delete company
![step 2](mockups/Step 2.png)

### Part 4 : Founders

1. In the Company details add the ability to add a Founders to a Company.
2. Each Founder can only belong to a single company.
3. Founder  Fields
    * Founder Full Name
    * Founder Title
4. Founders added should display in the company detail page. 

### Part 5 : Tags

1. In the COmpany details add the ability to tag a company with categories. 
2. Each category can belong to a number of different companies.
3. Tags added should appear in the company detail page.


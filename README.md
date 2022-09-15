# KARATE API FRAMEWORK

Karate is the only open-source tool to combine API test-automation, [performance-testing](https://github.com/karatelabs/karate/tree/master/karate-gatling) and even [UI automation](https://github.com/karatelabs/karate/tree/master/karate-core) into a **single**, *unified* framework. The BDD syntax popularized by [Cucumber](https://cucumber.io/docs/gherkin/reference/) is language-neutral, and easy for even non-programmers. Assertions and HTML reports are built-in, and you can run tests in parallel for speed.

## Getting Started
### Prerequisites

Karate requires at least Java 8 and then either Maven, Gradle, Eclipse or IntelliJ to be installed. Note that Karate works fine on OpenJDK.

```
Java    v8+
Maven   v3.8.1+
NodeJS  v16+
```


### Installation & execution
1. Build maven project

```
mvn install
```

2. Execute project tests

```
mvn clean test
```

## Running specified commands to execute tests

1. `mvn test -Dtest=CompaniesRunner#testCompanies`
   + Run test of class "CompaniesRunner" where the function called is "testCompanies"
   + The function "testCompanies()" tests a specified path
2. `mvn test -Dtest=CompaniesRunner#testTags`
   + Run test of class "CompaniesRunner" where the function called is "testTags"
   + The function "testTags()" tests by the tag specified in a .feature file
3. `mvn test -Dtest=CompaniesRunner#testSystemProperty`
   + Run test of class "CompaniesRunner" where the function called is "testSystemProperty"
   + The function "testSystemProperty()", it tests by a tag, set the env to the file "karate-config.js"
    

## Karate project structure

The folder structure for Karate tests is given in the Karate documentation on
[folder structure](https://github.com/intuit/karate#folder-structure), but the
summary is that:

* All tests are defined in `*.feature` files
* For every feature file package, you need to have an empty test-class in the same package under `src/test/java`
* Karate recommends keeping the `*.feature` files in the same folder as the test-class
* The `<build>` section of the `pom.xml` needs a small tweak for this ..
* A similar change needed in `build.gradle` file.


A `*.feature` file has the same syntax as [Gherkin/Cucumber](https://cucumber.io/docs/gherkin/reference/)
and is also described in Karate [documentation](https://github.com/intuit/karate#script-structure). The
key points are

* Lines that start with `#` are comments
* There are three sections
    * `Feature` : It provides a high-level description of a software feature, and to group related scenario
    * `Background` : The steps in this section are executed before every `Scenario` in that file.
    * `Scenario` : Each scenario is a test, a `.feature` file can contain multiple Scenarios.
* Each scenario is described using
    * `Given` : setting up the test
    * `When` : the test action that will be performed
    * `Then` : the expected outcome(s)
    



## References
+ https://karatelabs.github.io/karate/
+ https://github.com/karatelabs/karate
+ https://cucumber.io/docs/gherkin/reference/
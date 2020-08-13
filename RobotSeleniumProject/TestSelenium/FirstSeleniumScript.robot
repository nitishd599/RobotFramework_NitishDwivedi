*** Settings ***
Library    SeleniumLibrary   

Suite Setup	    Log 	I am inside Test Suite Setup
Suite Teardown	Log	I am inside Test Suite Teardown
Test Setup	    Log	I am inside Test Case Setup
Test Teardown	Log	I am inside Test Case Teardown 

Default Tags    sanity

*** Test Cases ***
TCforOnlyTagCheck
    [Tags]    smoke
    
    Open Browser                    https://google.com             chrome
    Close Browser
    

MyFirstSeleniumTestCase
    Log    Hello Selenium
    Set Tags    regression
    
    Open Browser                    https://google.com             chrome
    Set Browser Implicit Wait       2000
    Input Text                      xpath=//input[@type='text']    Robot Framework 
    Press Keys                      xpath=//input[@type='text']    ENTER
    Sleep                           2    
    Close Browser
    Log                             Test Completed
    

TCforUserKeywordsVariables
    Log    User Keyword & Variable Demo TC
    
    Set Tags        smoke2
    Remove Tags     smoke2
    
    Open Browser                    ${url}    chrome
    Set Browser Implicit Wait       2000
    Input Text                      id=txtUsername               ${username}[thisSite]
    Input Password                  id=txtPassword               ${password}[0]
    Click Button                    xpath=//*[@id='btnLogin']    
    Sleep                           2
    ClickWelcomeLink
    Sleep                           2
    Close Browser
    Log                             Test Completed
    

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com/ 
@{password}    admin123              Nitish@123
&{username}    thisSite=Admin        restAll=nitish.d599

*** Keywords ***
ClickWelcomeLink
    Click Element    xpath=//*[@id='welcome']    
    Sleep            2
    Click Element    //a[contains(text(),'Logout')]    
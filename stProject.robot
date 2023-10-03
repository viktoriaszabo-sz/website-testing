*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
Website testing
    Open Browser    https://www.jimms.fi/    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window

    ${Count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]/a
    ${referenceName}=    Get Text   xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[index]/a
   # ${refrencePosition}=    Get Vertical Position    xpath:/html/body/header/div
 

    Sleep    2   
    FOR    ${index}    IN RANGE    ${Count}
        Sleep    2
        Click Button    ${referenceName}  
        ${testName}=    Get Text    xpath:/html/body/main/div[2]/div/div[2]/div[2]/h1
        Log    ${index}
        Should Be Equal    ${referenceName}    ${testName}
        
    END
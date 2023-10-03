*** Settings ***
Library    SeleniumLibrary
Library    XML

*** Test Cases ***
Website testing
    Open Browser    https://www.jimms.fi/    Chrome    options=add_experimental_option("detach", True)

    Maximize Browser Window

    Reload Page
    Sleep    2

    ${Count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]
    #${referenceName}=    Get Text   xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]
    ${refrencePosition}=    Get Vertical Position    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]
 
  
    FOR    ${index}    IN RANGE    1    ${Count}+1
        
        Sleep    1 
        ${testName}=    Set Variable    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]
        ${receivedName}=    Get Text    ${testName}
        Click Element    ${testName}
        Sleep    1    

        ${referenceName}=    Set Variable   xpath:/html/body/main/div[2]/div/div[2]/div[2]/h1
        ${referenceReceived}=    Get Text    ${referenceName}
        
        Log    ${index}
        Should Be Equal    ${referenceReceived}    ${receivedName}
        
    END
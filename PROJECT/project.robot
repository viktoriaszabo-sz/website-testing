*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn


*** Test Cases ***
lets go    
    Open Browser    http://jimms.fi     
    ...    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Reload Page
    Sleep    1

    ${count} =     Get Element Count    
    ...     xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]
    ${referencePosition} =     Get Vertical Position    
    ...    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]
    
    FOR    ${index}    IN RANGE    1    ${count}+1
        Log    ${index}
        ${tablocator} =     Set Variable    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]
        Click Element    ${tablocator}
    END


other tasks
    Open Browser    http://jimms.fi     
    ...    Chrome    options=add_experimental_option("detach", True)
    #Maximize Browser Window
    Click Element    name:q
    Input Text    name:q    ps5
    Press Key  name:q  \\13  # Simulate pressing Enter key in the input field with id 'username'
    Set Screenshot Directory    C:\\Users\\vikiv\\Desktop\\1st module\\st\\Robot\\PROJECT
    Sleep    2    #needed
    Capture Element Screenshot    
    ...    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img
    
    Click Element 
    ...    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span
    Page Should Contain    Lisää koriin
    Page Should Contain Button    class:btn-icon
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a
    Click Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a

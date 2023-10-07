*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    String


*** Test Cases ***
1.landing pages   
    Open Browser    http://jimms.fi     
    ...    Chrome    options=add_experimental_option("detach", True)
    Maximize Browser Window
    Reload Page
    Sleep    1

    ${Count}=    Get Element Count    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[*]
    #${referenceName}=    Get Text   xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]
    ${refrencePosition}=    Get Vertical Position    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[1]
 
  
    FOR    ${index}    IN RANGE    1    ${Count}+1
        
        ${testName}=    Set Variable    xpath:/html/body/header/div/div[1]/jim-drilldown-mega-menu/nav/ul/li[${index}]
        ${receivedName}=    Get Text    ${testName}
        Click Element    ${testName}
        Sleep    1    

        ${referenceName}=    Set Variable   xpath:/html/body/main/div[2]/div/div[2]/div[2]/h1
        ${referenceReceived}=    Get Text    ${referenceName}
        
        Log    ${index}
        Run Keyword And Continue On Failure    Should Contain    ${referenceReceived}    ${receivedName}
    END


# ------------------------- THIS PART DEFINITELY WORKS --------------------------------
2.ps5 keyword search
    Maximize Browser Window
    Click Element    name:q
    Input Text    name:q    ps5
    Press Key  name:q  \\13  # Simulate pressing Enter key in the input field with id 'username'
    Set Screenshot Directory    C:\\Users\\vikiv\\Desktop\\1st module\\st\\Robot\\PROJECT
    Sleep    2    #needed
    Capture Element Screenshot    
    ...    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[1]/a/div/img
    
    Click Element 
    ...    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[2]/h5/a/span
3.find link  
    Page Should Contain    Lisää koriin
4.find button for "lisää koriin"   
    Page Should Contain Button    class:btn-icon
    Capture Element Screenshot    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a
5.add element to shopping cart    
    Click Element    xpath:/html/body/main/div[1]/div[2]/div/jim-product-cta-box/div/div[2]/div[2]/addto-cart-wrapper/div/a

# ------------------------- THIS PART DEFINITELY WORKS --------------------------------



extra task1 - payment
    Sleep    1
    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/a
    ${productPrice} =     Get Text    xpath:/html/body/main/div/div/div/div[1]/article/div/div[2]/div/div[3]/div[2]/div/span/span
    ${totalPrice} =     Get Text    xpath:/html/body/main/div/div/div/div[2]/div/div[1]/ul/li[5]/span
    Should Be Equal    ${productPrice}    ${totalPrice}
    Click Element    xpath:/html/body/main/div/div/div/div[2]/div/div[3]/a

    Select Radio Button    selectedTab    anonymous-tab-input
    Click Element    xpath:/html/body/main/div/div/div/div[2]/div[4]/div/div/form/input[3]

    Sleep    1
    Page Should Contain    Toimitusosoite
    Click Element    name:FirstName   
    Input Text    name:FirstName    Mike
    Click Element    name:LastName   
    Input Text    name:LastName    Hunt 
    Click Element    name:Address   
    Input Text    name:Address    Locastreet 23
    Click Element    name:PostalCode   
    Input Text    name:PostalCode    13100
    Click Element    name:City   
    Input Text    name:City    Locaville
    Click Element    name:EmailAddress   
    Input Text    name:EmailAddress    mike.hunt@student.hamk.fi
    Click Element    name:Phone   
    Input Text    name:Phone    +358403456789
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/div[6]/input
    
    Run Keyword And Continue On Failure    Scroll Element Into View    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input
    Wait Until Page Contains Element    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/form/div/input

    Page Should Contain    Toimitustapa
    Sleep    1
    Select Radio Button    DeliveryMethodID    PNP
    Run Keyword And Continue On Failure    Scroll Element Into View    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
    Wait Until Page Contains Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[1]/div/form/input[2]

    Page Should Contain    Noutopiste
    Sleep    1
    Select Radio Button    PickupPointID    PickupPointID_131003200
    Sleep    1
    Run Keyword And Continue On Failure    Scroll Element Into View    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/input
    Wait Until Page Contains Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/input
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/div/form/div[2]/input

    Page Should Contain    Maksutapa
    Select Radio Button    PaymentMethodID    OPEPO
    Run Keyword And Continue On Failure    Scroll Element Into View    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
    Wait Until Page Contains Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[2]/div/div[1]/div/div/div[2]/div/form/input[2]
    
    Sleep    1
    Page Should Contain    Tilauksen vahvistus
# --------------------------  should fail on multiple parts, because the scrolling cant go through without failing :/ ------------------------------------------
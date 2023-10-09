
*** Test Cases ***
Login
     Open Browser    http://jimms.fi       
    ...    Chrome    options=add_experimental_option("detach", True)  
    Maximize Browser Window

    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a

    Click Element    name:UserName    
    Input Text    name:UserName    Robot

    Click Element    name:Password    
    Input Text    name:Password    password

    Click Element    id:loginbtn

    Page Should Not Contain    Virheellinen käyttäjätunnus tai salasana.    #Invalid username or password.

    Close Browser

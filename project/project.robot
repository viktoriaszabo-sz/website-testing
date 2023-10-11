# Sara-Sofia Paananen

*** Settings ***
Library    SeleniumLibrary
Library    Collections


*** Test Cases ***
Select a product
    Open Browser    http://jimms.fi    Chrome    options=add_experimental_option("detach", True)
    
    Maximize Browser Window

    Page Should Contain    Oheislaitteet

    # Click
    Click Element    name:q
    Input Text    name:q    Logitech kuulokkeet
    Press Key    name:q    \\13    
    
    Sleep    1s

    # Add to cart
    Click Element    xpath:/html/body/main/div[2]/div/div[2]/div[5]/div/div[1]/product-box/div[2]/div[3]/addto-cart-wrapper/div/a

    Sleep    1s

    # Go to cart
    Click Element    xpath:/html/body/header/div/div[3]/jim-cart-dropdown/div/a

    Sleep    1s

    # Delete from cart
    Click Element    xpath:/html/body/main/div/div/div/div[1]/article/div/div[2]/div/div[1]/div/i

    Sleep    1s

    # Go back to shopping
    Click Element    xpath:/html/body/main/div/div/a
    
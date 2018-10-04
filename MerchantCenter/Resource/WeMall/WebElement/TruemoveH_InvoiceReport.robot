*** Variables ***
### Locator ###
${btn_search_invoice}               //input[@type="submit"]
${btn_tmh_form}                     //a[@class="btn btn-sm btn-danger margin-bottom-5"]
${txt_invoice_order_id}             //textarea[@name="secure_key"]
${txt_invoice_no_from}              id=invoice_no_from
${txt_invoice_no_to}                id=invoice_no_to
${btn_update_info}                  id=btn-update-invoice
${lbl_title_billing_update}         //h4[@class=" smaller bolder" and contains(text(),'Billing Address')]
${lnk_breadcrumb_update}            //ul[@class="breadcrumb"]//li[2]
${ddl_type_invoice}                 id=billing_type
${txt_box_company}                  id=billing_company
${txt_box_firstname}                id=billing_firstname
${txt_box_lastname}                 id=billing_lastname
${txt_branch_head}                  id=billing_branch_head
${txt_branch}                       id=billing_branch
${txt_tax_no}                       id=billing_tax_no
${txt_address}                      id=billing_address_1
${ddl_province}                     id=billing_province
${ddl_city}                         id=billing_city
${ddl_district}                     id=billing_district
${txt_postcode}                     id=billing_postcode
${txt_branch_value}                 id=branch_value
${lbl_corpname}                     //div[@id="billing_company-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_branch}                       //div[@id="billing_branch-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_tax_no}                       //div[@id="billing_tax_no-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_address}                      //div[@id="billing_address_1-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_province}                     //div[@id="billing_province-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_city}                         //div[@id="billing_city-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_district}                     //div[@id="billing_district-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_postcode}                     //div[@id="billing_postcode-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_name}                         //div[@id="billing_firstname-with-errors"]//ul[@class="list-unstyled"]//li
${lbl_lastname}                     //div[@id="billing_lastname-with-errors"]//ul[@class="list-unstyled"]//li


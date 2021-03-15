pageextension 58009 "Airlg. Customer Ledger Entries" extends "Customer Ledger Entries"
{
    layout
    {
        // Add changes to page layout here
        addafter("Entry No.")
        {
            field("BL No."; "BL No.")
            {
                ApplicationArea = All;
            }
            field("Purchase order No."; "Purchase order No.")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
pageextension 58007 "Airlg. Sales Cr. Memo Subform" extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Standard Sales Code"; "Standard Sales Code")
            {
                ApplicationArea = All;
            }
        }
    }


    var
        myInt: Integer;
}
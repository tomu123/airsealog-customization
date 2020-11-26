pageextension 58003 "Airlg. Post. Sales Cr. Mem Sub" extends "Posted Sales Cr. Memo Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Standard Sales Code"; "Standard Sales Code")
            {
                ApplicationArea = All;
                Editable = false;
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
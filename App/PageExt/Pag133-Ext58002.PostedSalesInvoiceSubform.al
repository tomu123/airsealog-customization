pageextension 58002 "Airlg. Post. Sales Inv. Sub." extends "Posted Sales Invoice Subform"
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
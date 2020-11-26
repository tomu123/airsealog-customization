pageextension 58000 "Airlg. Stand. Sales Code Card" extends "Standard Sales Code Card"
{
    layout
    {
        addbefore(StdSalesLines)
        {
            group(Airsealog)
            {
                Caption = 'Airsealog', comment = 'ESM="Airsealog"';
                field("Sales Detraction"; Rec."Sales Detraction")
                {
                    ApplicationArea = All;
                }
                field("Operation Type Detrac"; Rec."Operation Type Detrac")
                {
                    ApplicationArea = All;
                    Editable = "Sales Detraction";
                }
                field("Service Type Detrac"; Rec."Service Type Detrac")
                {
                    ApplicationArea = All;
                    Editable = "Sales Detraction";
                }
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
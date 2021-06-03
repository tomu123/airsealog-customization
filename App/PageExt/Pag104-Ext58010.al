pageextension 58010 "Airlg. Account Schedule" extends "Account Schedule"

{
    layout
    {
        // Add changes to page layout here
        modify("Dimension 1 Totaling")
        {
            Visible = true;
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
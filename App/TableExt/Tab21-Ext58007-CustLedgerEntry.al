tableextension 58007 "Airlg. Cust. Ledger Entry" extends "Cust. Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(58002; "BL No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° BL/Hawb', comment = 'ESM="N° BL/Hawb"';
        }
        field(58013; "Purchase order No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Purchase order No.', comment = 'ESM="Orden Compra"';
        }
    }

    var
        myInt: Integer;
}
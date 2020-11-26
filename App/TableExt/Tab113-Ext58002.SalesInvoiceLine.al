tableextension 58002 "Airlg. Sales Invoice Line" extends "Sales Invoice Line"
{
    fields
    {
        field(58000; "Standard Sales Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Standard Sales Code', comment = 'ESM="Cód. venta estándar"';
            TableRelation = "Standard Sales Code";
        }
    }

    var
        myInt: Integer;
}
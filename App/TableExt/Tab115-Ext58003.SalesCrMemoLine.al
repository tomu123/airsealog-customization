tableextension 58003 "Airlg. Sales Cr.Memo Line" extends "Sales Cr.Memo Line"
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
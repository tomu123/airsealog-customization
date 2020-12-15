tableextension 58001 "Airlg. Sales Line" extends "Sales Line"
{
    fields
    {
        field(58000; "Standard Sales Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Standard Sales Code', comment = 'ESM="Cód. venta estándar"';
            TableRelation = "Standard Sales Code".Code;
            trigger OnValidate()
            var
                StandardSalesLine: Record "Standard Sales Line";
            begin
                if "Standard Sales Code" <> '' then begin
                    StandardSalesLine.Reset();
                    StandardSalesLine.SetRange("Standard Sales Code", "Standard Sales Code");
                    if StandardSalesLine.FindFirst() then begin
                        StandardSalesLine.TESTFIELD(Type, StandardSalesLine.Type::"G/L Account");
                        Validate(Type, StandardSalesLine.Type);
                        Validate("No.", StandardSalesLine."No.");
                        Description := StandardSalesLine.Description;
                        Validate(Quantity, 1);
                        Validate("Unit of Measure Code", 'UND');
                        if StandardSalesLine."Shortcut Dimension 1 Code" <> '' then
                            Validate("Shortcut Dimension 1 Code", StandardSalesLine."Shortcut Dimension 1 Code");
                        if StandardSalesLine."Shortcut Dimension 2 Code" <> '' then
                            Validate("Shortcut Dimension 2 Code", StandardSalesLine."Shortcut Dimension 2 Code");
                        "Standard Sales Code" := StandardSalesLine."Standard Sales Code";
                    end;
                end else begin
                    Type := Type::" ";
                    "No." := '';
                    Description := '';
                end;
                OnValidateStandardSalesCode(xRec, Rec);
            end;
        }
    }

    [IntegrationEvent(false, false)]
    local procedure OnValidateStandardSalesCode(var xSalesLine: Record "Sales Line"; var SalesLine: Record "Sales Line");
    begin
    end;

    var
        myInt: Integer;
}
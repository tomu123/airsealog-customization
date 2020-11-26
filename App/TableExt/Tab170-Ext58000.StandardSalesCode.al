tableextension 58000 "Airlg. Stand. Sales Code" extends "Standard Sales Code"
{
    fields
    {
        field(58000; "Sales Detraction"; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Detraction', Comment = 'ESM="Detracción"';
            trigger OnValidate()
            begin
                if not "Sales Detraction" then begin
                    "Operation Type Detrac" := '';
                    "Service Type Detrac" := '';
                end;
            end;
        }
        field(58001; "Operation Type Detrac"; Code[2])
        {
            DataClassification = ToBeClassified;
            Caption = 'Operation Type Detraction', Comment = 'ESM="Tipo de operación"';
            trigger OnLookup()
            begin
                DetractCalculation.ValidateTypeOfOperationSales("Operation Type Detrac");
            end;
        }

        field(58002; "Service Type Detrac"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'Service Type Detraction', Comment = 'ESM="Tipo de servicio"';
            trigger OnLookup()
            var
                PercentageSalesDetraction: Decimal;
            begin
                DetractCalculation.ValidateTypeOfServiceSales("Service Type Detrac", PercentageSalesDetraction);
            end;
        }
    }

    var
        DetractCalculation: Codeunit "DetrAction Calculation";
}
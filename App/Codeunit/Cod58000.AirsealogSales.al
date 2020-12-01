codeunit 58000 "Airsealog Sales"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnValidateStandardSalesCode', '', true, true)]
    local procedure SetValidateStandardSalesCode(var xSalesLine: Record "Sales Line"; var SalesLine: Record "Sales Line")
    begin
        CheckServiceTypeDetractionForSalesHeader(SalesLine);
        CheckTypeOperationDocumentForSalesHeader(SalesLine);
        AssignSalesDetraction(SalesLine);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Invoice Subform", 'OnAfterValidateEvent', 'Unit Price', true, true)]
    local procedure RefreshDetractionAmount(var Rec: Record "Sales Line")
    begin
        //AssignSalesDetraction(Rec);
    end;

    local procedure CheckServiceTypeDetractionForSalesHeader(SalesLine: Record "Sales Line")
    var
        SalesLine2: Record "Sales Line";
        StdSalesCode: Record "Standard Sales Code";
        StdSalesCode2: Record "Standard Sales Code";
        DifferentDetractionServiceErr: Label 'For a document, only Charge Code that have the same Detraction service code are allowed.', comment = 'ESM="Para un documento sólo se permite Charge Code que tengan el mismo codigo de servicio de Detracción."';
    begin
        StdSalesCode.RESET;
        StdSalesCode.SETRANGE(Code, SalesLine."Standard Sales Code");
        if StdSalesCode.FindSet() then;

        SalesLine2.RESET;
        SalesLine2.SetRange("Document Type", SalesLine."Document Type");
        SalesLine2.SetRange("Document No.", SalesLine."Document No.");
        SalesLine2.SetRange("Standard Sales Code", '<>%1', SalesLine."Standard Sales Code");
        if SalesLine2.FindSet() then begin
            repeat
                StdSalesCode2.RESET;
                StdSalesCode2.SETRANGE(Code, SalesLine2."Standard Sales Code");
                if StdSalesCode2.FINDSET then begin
                    if StdSalesCode."Service Type Detrac" <> StdSalesCode2."Service Type Detrac" then
                        Error(DifferentDetractionServiceErr);
                end;
            until SalesLine2.NEXT = 0;
        end;
    end;

    local procedure CheckTypeOperationDocumentForSalesHeader(SalesLine: Record "Sales Line")
    var
        SalesLine2: Record "Sales Line";
        StdSalesCode: Record "Standard Sales Code";
        StdSalesCode2: Record "Standard Sales Code";
        DifferentTypeOperationDocumentErr: Label 'For a document, only Charge Code that have the same Type Operation Document code are allowed.', comment = 'ESM="Para un documento sólo se permite Charge Code que tengan el mismo  Tipo de Operación."';
    begin
        StdSalesCode.RESET;
        StdSalesCode.SETRANGE(Code, SalesLine."Standard Sales Code");
        if StdSalesCode.FindSet() then;

        SalesLine2.RESET;
        SalesLine2.SetRange("Document Type", SalesLine."Document Type");
        SalesLine2.SetRange("Document No.", SalesLine."Document No.");
        SalesLine2.SetRange("Standard Sales Code", '<>%1', SalesLine."Standard Sales Code");
        if SalesLine2.FindSet() then begin
            repeat
                StdSalesCode2.RESET;
                StdSalesCode2.SETRANGE(Code, SalesLine2."Standard Sales Code");
                if StdSalesCode2.FINDSET then begin
                    if StdSalesCode."Operation Type Detrac" <> StdSalesCode2."Operation Type Detrac" then
                        Error(DifferentTypeOperationDocumentErr);
                end;
            until SalesLine2.NEXT = 0;
        end;
    end;

    local procedure AssignSalesDetraction(SalesLine: Record "Sales Line")
    var
        StdSalesCode: Record "Standard Sales Code";
        SalesHeader: Record "Sales Header";
        DetractCalculation: Codeunit "DetrAction Calculation";
    begin
        // ValidateSameServiceTypeDetractionForSalesHeader(SalesLine);
        // ValidateSameTypeOperationDocumentForSalesHeader(SalesLine);
        if StdSalesCode.Get(SalesLine."Standard Sales Code") and
           StdSalesCode."Sales Detraction" then begin
            StdSalesCode.TestField("Service Type Detrac");
            StdSalesCode.TestField("Operation Type Detrac");
            SalesHeader.Reset();
            SalesHeader.SetRange("Document Type", SalesLine."Document Type");
            SalesHeader.SetRange("No.", SalesLine."Document No.");
            if SalesHeader.FindSet() then begin
                SalesHeader.Validate("Sales Detraction", StdSalesCode."Sales Detraction");
                SalesHeader.Validate("Service Type Detrac", StdSalesCode."Service Type Detrac");
                SalesHeader.Validate("Operation Type Detrac", StdSalesCode."Operation Type Detrac");
                SalesHeader.Validate("Sales % Detraction", DetractCalculation.GetPercentageDetraction(SalesHeader."Service Type Detrac"));
                SalesHeader.Modify();
            end;
        end else
            exit;
    end;
}
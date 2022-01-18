tableextension 58004 "Airlg. Sales Header" extends "Sales Header"
{
    fields
    {
        field(58000; "Shortcut Dimension 3 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code', comment = 'ESM="Cód. dim. acceso dir. 3"';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                          Blocked = CONST(false));
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3, "Shortcut Dimension 3 Code");
            end;
        }
        field(58001; "Cargowise Invoice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Cargowise Invoice No.', comment = 'ESM="No. Factura Cargowise"';
            trigger OnValidate()
            begin
                Rec."Airsealog-Cargowise Inv No." := Rec."Cargowise Invoice No.";
            end;
        }

        field(58002; "BL No."; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'N° BL/Hawb', comment = 'ESM="N° BL/Hawb"';
        }
        field(58003; "Shipper Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Shipper Name', comment = 'ESM="Nombre remitente"';
        }
        field(58004; "Consignee Name"; Text[40])
        {
            DataClassification = ToBeClassified;
            Caption = 'Consignee Name', comment = 'ESM="Nombre destinatario"';
        }
        field(58005; "Routing No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Routing No.', comment = 'ESM="No. Routing"';
        }

        field(58006; "No. Sales Shipment"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'No. Sales Shipment', comment = 'ESM="No. Guía Remisión"';
        }
        field(58007; Placa; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Ship/Flight Transport', comment = 'ESM="Barco/Vuelo de Transporte"';
        }
        field(58008; "Carrier Name"; Text[80])
        {
            DataClassification = ToBeClassified;
            Caption = 'Carrier Name', comment = 'ESM="Nombre Transportista"';
        }
        field(58009; Origin; Code[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Origin', comment = 'ESM="Origen"';
        }
        field(58010; Destination; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Destination', comment = 'ESM="Destino"';
        }
        field(58011; "Get Out Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Get Out Date', comment = 'ESM="Fecha Salida"';
        }
        field(58012; "Arrived Date"; Date)
        {
            DataClassification = ToBeClassified;
            Caption = 'Arrived Date', comment = 'ESM="Fecha Llegada"';
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

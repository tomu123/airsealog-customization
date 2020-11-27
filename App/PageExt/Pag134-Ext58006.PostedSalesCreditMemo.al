pageextension 58006 "Airlg. Posted Sales Credit Mem" extends "Posted Sales Credit Memo"
{
    layout
    {
        addbefore(SalesCrMemoLines)
        {
            group(Airsealog)
            {
                Caption = 'Airsealog', comment = 'ESM="Airselaog"';
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Cargowise Invoice No."; "Cargowise Invoice No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("BL No."; "BL No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Shipper Name"; "Shipper Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Consignee Name"; "Consignee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Routing No."; "Routing No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("No. Sales Shipment"; "No. Sales Shipment")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Purchase order No."; "Purchase order No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Placa; Placa)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Carrier Name"; "Carrier Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Origin; Origin)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Get Out Date"; "Get Out Date")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Arrived Date"; "Arrived Date")
                {
                    ApplicationArea = All;
                    Editable = false;
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
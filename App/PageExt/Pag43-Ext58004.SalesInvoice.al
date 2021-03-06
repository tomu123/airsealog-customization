pageextension 58004 "Airlg. Sales Invoice" extends "Sales Invoice"
{
    layout
    {
        addbefore(SalesLines)
        {
            group(Airsealog)
            {
                Caption = 'Airsealog', comment = 'ESM="Airselaog"';
                field("Shortcut Dimension 3 Code"; "Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                }
                field("Cargowise Invoice No."; "Cargowise Invoice No.")
                {
                    ApplicationArea = All;
                }
                field("BL No."; "BL No.")
                {
                    ApplicationArea = All;
                }
                field("Shipper Name"; "Shipper Name")
                {
                    ApplicationArea = All;
                }
                field("Consignee Name"; "Consignee Name")
                {
                    ApplicationArea = All;
                }
                field("Routing No."; "Routing No.")
                {
                    ApplicationArea = All;
                }
                field("No. Sales Shipment"; "No. Sales Shipment")
                {
                    ApplicationArea = All;
                }
                field("Purchase order No."; "Purchase order No.")
                {
                    ApplicationArea = All;
                }
                field(Placa; Placa)
                {
                    ApplicationArea = All;
                }
                field("Carrier Name"; "Carrier Name")
                {
                    ApplicationArea = All;
                }
                field(Origin; Origin)
                {
                    ApplicationArea = All;
                }
                field(Destination; Destination)
                {
                    ApplicationArea = All;
                }
                field("Get Out Date"; "Get Out Date")
                {
                    ApplicationArea = All;
                }
                field("Arrived Date"; "Arrived Date")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addafter("&Invoice")
        {
            action(LordOfNight)
            {
                ApplicationArea = All;
                Caption = 'Lord of night', Comment = 'ESM="Se??or de la noche"';
                Visible = ShowMrNight;
                trigger OnAction()
                var
                    Cod58000: Codeunit "Airsealog Sales";
                begin
                    Cod58000.RepopulateFieldCustLedgerEntry();
                    Message('Finished Lord of night.');
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowMrNight := UserId = 'ULN365BC';
    end;

    var
        ShowMrNight: Boolean;
}
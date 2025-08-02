page 50163 "Payment Method Card"
{
    PageType = Card;
    SourceTable = "Payment Methods";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Payment Method Code"; Rec."Payment Method Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Company Paid"; Rec."Company Paid") { ApplicationArea = All; }
            }
        }
    }
}



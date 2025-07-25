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
                field("Payment Method Code"; "Payment Method Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Company Paid"; "Company Paid") { ApplicationArea = All; }
            }
        }
    }
}

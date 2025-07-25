page 50162 "Payment Methods List"
{
    PageType = List;
    SourceTable = "Payment Methods";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Payment Method Code"; "Payment Method Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Company Paid"; "Company Paid") { ApplicationArea = All; }
            }
        }
    }
}

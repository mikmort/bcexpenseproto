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
                field("Payment Method Code"; Rec."Payment Method Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Company Paid"; Rec."Company Paid") { ApplicationArea = All; }
            }
        }
    }
}



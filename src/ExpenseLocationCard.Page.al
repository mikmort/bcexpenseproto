page 50161 "Expense Location Card"
{
    PageType = Card;
    SourceTable = "Expense Locations";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Location Code"; Rec."Location Code") { ApplicationArea = All; }
                field("Country Region Code"; Rec."Country Region Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
            }
        }
    }
}



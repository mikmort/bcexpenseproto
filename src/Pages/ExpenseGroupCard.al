page 50159 "Expense Group Card"
{
    PageType = Card;
    SourceTable = "Expense Groups";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Expense Group Code"; "Expense Group Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
            }
        }
    }
}

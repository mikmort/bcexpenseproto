page 50155 "Expense Category Card"
{
    PageType = Card;
    SourceTable = "Expense Categories";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Category Code"; "Category Code") { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Expense Group Code"; "Expense Group Code") { ApplicationArea = All; }
                field("Posting Group Code"; "Posting Group Code") { ApplicationArea = All; }
                field(Refundable; Refundable) { ApplicationArea = All; }
                field(Active; Active) { ApplicationArea = All; }
            }
        }
    }
}

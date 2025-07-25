page 50154 "Expense Categories List"
{
    PageType = List;
    SourceTable = "Expense Categories";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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

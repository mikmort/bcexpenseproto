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
                field("Category Code"; Rec."Category Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Expense Group Code"; Rec."Expense Group Code") { ApplicationArea = All; }
                field("Posting Group Code"; Rec."Posting Group Code") { ApplicationArea = All; }
                field(Refundable; Rec.Refundable) { ApplicationArea = All; }
                field(Active; Rec.Active) { ApplicationArea = All; }
            }
        }
    }
}



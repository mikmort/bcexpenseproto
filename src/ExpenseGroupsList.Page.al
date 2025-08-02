page 50158 "Expense Groups List"
{
    PageType = List;
    SourceTable = "Expense Groups";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Group Code"; Rec."Expense Group Code") { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
            }
        }
    }
}



page 50181 "Expense Itemization Lines List"
{
    PageType = List;
    SourceTable = "Expense Itemization Lines";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Itemization Line Id"; Rec."Itemization Line Id") { ApplicationArea = All; }
                field("Itemization Id"; Rec."Itemization Id") { ApplicationArea = All; }
                field("Start Date"; Rec."Start Date") { ApplicationArea = All; }
                field("End Date"; Rec."End Date") { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field(Description; Rec.Description) { ApplicationArea = All; }
                field("Expense Location Code"; Rec."Expense Location Code") { ApplicationArea = All; }
            }
        }
    }
}



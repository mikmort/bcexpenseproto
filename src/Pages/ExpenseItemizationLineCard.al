page 50182 "Expense Itemization Line Card"
{
    PageType = Card;
    SourceTable = "Expense Itemization Lines";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Itemization Line Id"; "Itemization Line Id") { ApplicationArea = All; }
                field("Itemization Id"; "Itemization Id") { ApplicationArea = All; }
                field("Start Date"; "Start Date") { ApplicationArea = All; }
                field("End Date"; "End Date") { ApplicationArea = All; }
                field(Amount; Amount) { ApplicationArea = All; }
                field(Description; Description) { ApplicationArea = All; }
                field("Expense Location Code"; "Expense Location Code") { ApplicationArea = All; }
            }
        }
    }
}

page 50188 "Posted Expense Report Line Card"
{
    PageType = Card;
    SourceTable = "Posted Expense Report Lines";
    ApplicationArea = All;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Posted Report Id"; "Posted Report Id") { ApplicationArea = All; }
                field("Line Number"; "Line Number") { ApplicationArea = All; }
                field("Employee Id"; "Employee Id") { ApplicationArea = All; }
                field("Category Code"; "Category Code") { ApplicationArea = All; }
                field(Amount; Amount) { ApplicationArea = All; }
                field("Currency Code"; "Currency Code") { ApplicationArea = All; }
                field("Expense Location Code"; "Expense Location Code") { ApplicationArea = All; }
            }
        }
    }
}

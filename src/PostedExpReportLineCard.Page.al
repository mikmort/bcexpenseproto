page 50188 "Posted Exp. Report Line Card"
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
                field("Posted Report Id"; Rec."Posted Report Id") { ApplicationArea = All; }
                field("Line Number"; Rec."Line Number") { ApplicationArea = All; }
                field("Employee Id"; Rec."Employee Id") { ApplicationArea = All; }
                field("Category Code"; Rec."Category Code") { ApplicationArea = All; }
                field(Amount; Rec.Amount) { ApplicationArea = All; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
                field("Expense Location Code"; Rec."Expense Location Code") { ApplicationArea = All; }
            }
        }
    }
}



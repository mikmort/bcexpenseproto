page 50167 "Expense Policy Card"
{
    PageType = Card;
    SourceTable = "Expense Policies";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Policy Id"; Rec."Policy Id") { ApplicationArea = All; }
                field("Expense Category Code"; Rec."Expense Category Code") { ApplicationArea = All; }
                field("Expense Location Code"; Rec."Expense Location Code") { ApplicationArea = All; }
                field("Condition Expression"; Rec."Condition Expression") { ApplicationArea = All; }
                field("Receipt Required"; Rec."Receipt Required") { ApplicationArea = All; }
                field("Daily Limit Amount"; Rec."Daily Limit Amount") { ApplicationArea = All; }
                field("Effective From"; Rec."Effective From") { ApplicationArea = All; }
                field("Effective To"; Rec."Effective To") { ApplicationArea = All; }
            }
        }
    }
}



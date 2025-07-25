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
                field("Policy Id"; "Policy Id") { ApplicationArea = All; }
                field("Expense Category Code"; "Expense Category Code") { ApplicationArea = All; }
                field("Expense Location Code"; "Expense Location Code") { ApplicationArea = All; }
                field("Condition Expression"; "Condition Expression") { ApplicationArea = All; }
                field("Receipt Required"; "Receipt Required") { ApplicationArea = All; }
                field("Daily Limit Amount"; "Daily Limit Amount") { ApplicationArea = All; }
                field("Effective From"; "Effective From") { ApplicationArea = All; }
                field("Effective To"; "Effective To") { ApplicationArea = All; }
            }
        }
    }
}

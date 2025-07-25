page 50166 "Expense Policies List"
{
    PageType = List;
    SourceTable = "Expense Policies";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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

page 50168 "Expense Management Setup"
{
    PageType = Card;
    SourceTable = "Expense Management Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Setup Id"; "Setup Id") { ApplicationArea = All; }
                field("Expense Report No. Sequence"; "Expense Report No. Sequence") { ApplicationArea = All; }
                field("Posted Expense Report No. Sequence"; "Posted Expense Report No. Sequence") { ApplicationArea = All; }
                field("Enable Expense Agent"; "Enable Expense Agent") { ApplicationArea = All; }
            }
        }
    }
}

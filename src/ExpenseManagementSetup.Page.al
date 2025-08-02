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
                field("Setup Id"; Rec."Setup Id") { ApplicationArea = All; }
                field("Expense Report No. Sequence"; Rec."Expense Report No. Sequence") { ApplicationArea = All; }
                field("Posted Expense Report No Seq."; Rec."Posted Expense Report No Seq.") { ApplicationArea = All; }
                field("Enable Expense Agent"; Rec."Enable Expense Agent") { ApplicationArea = All; }
            }
        }
    }
}



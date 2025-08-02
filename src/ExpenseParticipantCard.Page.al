page 50184 "Expense Participant Card"
{
    PageType = Card;
    SourceTable = "Expense Participants";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Participant Id"; Rec."Participant Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Participant Name"; Rec."Participant Name") { ApplicationArea = All; }
                field("Participant Type"; Rec."Participant Type") { ApplicationArea = All; }
            }
        }
    }
}



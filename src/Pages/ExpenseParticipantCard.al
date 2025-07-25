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
                field("Participant Id"; "Participant Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Participant Name"; "Participant Name") { ApplicationArea = All; }
                field("Participant Type"; "Participant Type") { ApplicationArea = All; }
            }
        }
    }
}

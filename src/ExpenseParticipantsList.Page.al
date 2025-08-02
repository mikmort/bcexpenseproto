page 50183 "Expense Participants List"
{
    PageType = List;
    SourceTable = "Expense Participants";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Participant Id"; Rec."Participant Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Participant Name"; Rec."Participant Name") { ApplicationArea = All; }
                field("Participant Type"; Rec."Participant Type") { ApplicationArea = All; }
            }
        }
    }
}



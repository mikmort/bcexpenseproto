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
                field("Participant Id"; "Participant Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Participant Name"; "Participant Name") { ApplicationArea = All; }
                field("Participant Type"; "Participant Type") { ApplicationArea = All; }
            }
        }
    }
}

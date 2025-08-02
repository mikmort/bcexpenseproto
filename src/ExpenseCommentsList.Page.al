page 50175 "Expense Comments List"
{
    PageType = List;
    SourceTable = "Expense Comments";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Comment Id"; Rec."Comment Id") { ApplicationArea = All; }
                field("Report Id"; Rec."Report Id") { ApplicationArea = All; }
                field("Line Id"; Rec."Line Id") { ApplicationArea = All; }
                field("Comment Text"; Rec."Comment Text") { ApplicationArea = All; }
                field("Comment Date Time"; Rec."Comment Date Time") { ApplicationArea = All; }
                field("Created By"; Rec."Created By") { ApplicationArea = All; }
            }
        }
    }
}



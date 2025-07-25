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
                field("Comment Id"; "Comment Id") { ApplicationArea = All; }
                field("Report Id"; "Report Id") { ApplicationArea = All; }
                field("Line Id"; "Line Id") { ApplicationArea = All; }
                field("Comment Text"; "Comment Text") { ApplicationArea = All; }
                field("Comment Date Time"; "Comment Date Time") { ApplicationArea = All; }
                field("Created By"; "Created By") { ApplicationArea = All; }
            }
        }
    }
}

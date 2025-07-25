page 50176 "Expense Comment Card"
{
    PageType = Card;
    SourceTable = "Expense Comments";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
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

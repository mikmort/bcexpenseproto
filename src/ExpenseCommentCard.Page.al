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



page 50169 "Posted Expense Reports List"
{
    PageType = List;
    SourceTable = "Posted Expense Report Headers";
    ApplicationArea = All;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Posted Report Id"; Rec."Posted Report Id") { ApplicationArea = All; }
                field("Report Id"; Rec."Report Id") { ApplicationArea = All; }
                field("Employee Id"; Rec."Employee Id") { ApplicationArea = All; }
                field("Posted Date"; Rec."Posted Date") { ApplicationArea = All; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
            }
        }
    }
}



page 50170 "Posted Expense Report Card"
{
    PageType = Card;
    SourceTable = "Posted Expense Report Headers";
    ApplicationArea = All;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Posted Report Id"; "Posted Report Id") { ApplicationArea = All; }
                field("Report Id"; "Report Id") { ApplicationArea = All; }
                field("Employee Id"; "Employee Id") { ApplicationArea = All; }
                field("Posted Date"; "Posted Date") { ApplicationArea = All; }
                field("Currency Code"; "Currency Code") { ApplicationArea = All; }
                field("Total Amount"; "Total Amount") { ApplicationArea = All; }
            }
        }
    }
}

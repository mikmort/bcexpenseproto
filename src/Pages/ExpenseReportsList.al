page 50152 "Expense Reports List"
{
    PageType = List;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Report Id"; "Report Id") { ApplicationArea = All; }
                field("Employee Id"; "Employee Id") { ApplicationArea = All; }
                field(Purpose; Purpose) { ApplicationArea = All; }
                field(Destination; Destination) { ApplicationArea = All; }
                field("Report Date"; "Report Date") { ApplicationArea = All; }
                field("Posting Date"; "Posting Date") { ApplicationArea = All; }
                field("Currency Code"; "Currency Code") { ApplicationArea = All; }
                field("Total Amount"; "Total Amount") { ApplicationArea = All; }
                field(Status; Status) { ApplicationArea = All; }
                field("Payment Method Code"; "Payment Method Code") { ApplicationArea = All; }
            }
        }
    }
}

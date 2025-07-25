page 50153 "Expense Report Card"
{
    PageType = Card;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
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
                field("Pre Approval Number"; "Pre Approval Number") { ApplicationArea = All; }
                field("Receipts Attached"; "Receipts Attached") { ApplicationArea = All; }
                field("Created By"; "Created By") { ApplicationArea = All; }
                field("Created Date Time"; "Created Date Time") { ApplicationArea = All; }
                field("Modified Date Time"; "Modified Date Time") { ApplicationArea = All; }
            }
        }
    }
}

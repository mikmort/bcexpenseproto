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
                field("Report Id"; Rec."Report Id") { ApplicationArea = All; }
                field("Employee Id"; Rec."Employee Id") { ApplicationArea = All; }
                field(Purpose; Rec.Purpose) { ApplicationArea = All; }
                field(Destination; Rec.Destination) { ApplicationArea = All; }
                field("Report Date"; Rec."Report Date") { ApplicationArea = All; }
                field("Posting Date"; Rec."Posting Date") { ApplicationArea = All; }
                field("Currency Code"; Rec."Currency Code") { ApplicationArea = All; }
                field("Total Amount"; Rec."Total Amount") { ApplicationArea = All; }
                field(Status; Rec.Status) { ApplicationArea = All; }
                field("Payment Method Code"; Rec."Payment Method Code") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("New Expense Report")
            {
                ApplicationArea = All;
                Caption = 'New Expense Report';
                Image = New;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Create a new expense report';

                trigger OnAction()
                var
                    ExpenseReport: Record "Expense Reports";
                    ExpenseReportCard: Page "Expense Report Card";
                begin
                    // Create a new record and insert it to get a proper primary key
                    ExpenseReport.Init();
                    ExpenseReport.Insert(true); // This will trigger OnInsert and assign ID
                    
                    // Open the card for the new record
                    ExpenseReportCard.SetRecord(ExpenseReport);
                    ExpenseReportCard.RunModal();
                    CurrPage.Update(false);
                end;
            }
        }
    }
}



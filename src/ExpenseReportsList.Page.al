page 50152 "Expense Reports List"
{
    PageType = List;
    SourceTable = "Expense Reports";
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;

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
                    // Create and insert a new record with proper error handling
                    Clear(ExpenseReport);
                    ExpenseReport.Init();
                    if ExpenseReport.Insert(true) then begin // Insert with triggers
                        // Commit to end the transaction before opening modal
                        if not ExpenseReport.Get(ExpenseReport."Report Id") then
                            exit; // Safety check
                        
                        // Open the card for the new record
                        ExpenseReportCard.SetRecord(ExpenseReport);
                        ExpenseReportCard.Run();
                        CurrPage.Update(false);
                    end;
                end;
            }
        }
    }
}


